//
// Created by Cornelius Braun on 21.07.21.
//

#include "RHLGP.h"

#define DEBUG(x) //x
#define DEL_INFEASIBLE(x) //x

//===========================================================================
// this is needed for step -- taken from lgp_tree.cpp
typedef LGP_Tree_SolutionData* OptLGP_SolutionDataPtr;
bool sortComp(const LGP_Node* a, const LGP_Node* b) {
	if(!a->isInfeasible && b->isInfeasible) return true;
	if(a->isInfeasible && !b->isInfeasible) return false;
	return a->cost.last() < b->cost.last();
}
bool sortComp2(const OptLGP_SolutionDataPtr& a, const OptLGP_SolutionDataPtr& b) {
	return sortComp(a->node, b->node);
}


//===========================================================================
// set the new configuration in C
void getEndConfig(rai::Configuration &C, shared_ptr<KOMO> komo) {
	C.reset_q();
	C.frames.clear();
	C.activeJoints.clear();
	FrameL F = komo->timeSlices[komo->k_order+komo->T-1];

	// add to next config
	C.addCopies(F, C.forces);		//< forces is empty in our scenarios
	C.pruneInactiveJoints();
	for(rai::Frame* f : C.frames) {
		if (f->joint && f->joint->active){
			if (f->joint->type==rai::JT_free) f->setJoint(rai::JT_rigid);											// make free joints rigid --> this is the only change to the end config
			else if(f->joint->active && f->joint->type!=rai::JT_rigid) C.activeJoints.append(f->joint);	// append active joints
		}
	}
	C.checkConsistency();
}

//===========================================================================
// increment costs and collisions
void RHLGP_solver::getStats(BoundType bound, shared_ptr<KOMO> komo) {
	Graph result = komo->getReport((komo->verbose>0 && bound>=2));
	DEBUG(FILE("z.problem.cost") <<result;);
	double cost_here = result.get<double>("sos");
	double constraints_here = result.get<double>("eq") + result.get<double>("ineq");
	cout << "ITERATION RESULTS: " << "; COSTS: " << cost_here << "; CONSTRAINTS: " << constraints_here <<endl;
}

//===========================================================================
// overloading getSkeleton with horizon length
extern rai::Array<SkeletonSymbol> skeletonModes;
Skeleton LGP_Node::getSkeleton(bool finalStateOnly, uint from, uint to) const {
	rai::Array<Graph*> states;
	rai::Array<LGP_Node *> path = getTreePath();
	arr times;
	if(!finalStateOnly) {
		for(int i = from; i < (int) std::min(path.N, to); ++i) {				//< only take entries between in [from,to]
			LGP_Node *node = path.elem(i);
			times.append(node->time);
			states.append(node->folState);
		}
	} else {
		times.append(1.);
		states.append(this->folState);
	}

	//setup a done marker array: which literal in each state is DONE
	uint maxLen=0;
	for(Graph* s:states) if(s->N>maxLen) maxLen = s->N;
	boolA done(states.N, maxLen);
	done = false;

	Skeleton skeleton;

	for(uint k=0; k<states.N; k++) {
		Graph& G = *states(k);
		for(uint i=0; i<G.N; i++) {
			if(!done(k, i)) {
				Node* n = G(i);
				if(n->isGraph() && n->graph().findNode("%decision")) continue; //don't pickup decision literals
				StringA symbols;
				for(Node* p:n->parents) symbols.append(p->key);

				//check if there is a predicate
				if(!symbols.N) continue;

				//check if predicate is a SkeletonSymbol
				if(!rai::Enum<SkeletonSymbol>::contains(symbols.first())) continue;

				//trace into the future
				uint k_end=k+1;
				for(; k_end<states.N; k_end++) {
					Node* persists = getEqualFactInList(n, *states(k_end), true);
					if(!persists) break;
					done(k_end, persists->index) = true;
				}
				k_end--;

				rai::Enum<SkeletonSymbol> sym(symbols.first());
				if(k_end==states.N-1) {
					skeleton.append(SkeletonEntry({times(k), times.last(), sym, symbols({1, -1})}));
				} else {
					skeleton.append(SkeletonEntry({times(k), times(k_end), sym, symbols({1, -1})}));
				}
			}
		}
	}

	for(uint i=0; i<skeleton.N; i++) {
		SkeletonEntry& se =  skeleton.elem(i);
		if(skeletonModes.contains(se.symbol)){ //S(i) is about a switch
			if(se.phase1<times.last()){
				se.phase1 += 1.; //*** MODES EXTEND TO THE /NEXT/ TIME SLICE ***
			}else{
				se.phase1 = -1.;
			}
		}
		// shift the times to [0,horizon-1]
		if (from > 0) {
			se.phase0 -= from-1;
			se.phase1 -= from-1;
			if (se.phase1 > to || se.phase1 < 0) se.phase1 = -1;
		}
	}

	return skeleton;
}

//===========================================================================
// this gets the skeleton for the next horizon
Skeleton LGP_Node::getNextHorizonSkeleton(intA window) const {
	// get times of window
	int horizon = window.last()-window.first();
	int endT = window.last()-1;
	int startT = endT-horizon-1;
	Skeleton S_now = getSkeleton(false, 0, window.last());
	Skeleton S_whole = getSkeleton();

	Skeleton S;
	for (uint i = 0; i < S_now.N; ++i) {
		SkeletonEntry se = S_now.elem(i);
		SkeletonEntry st = S_whole.elem(i);

		if (st.phase0<startT && (st.phase1>=startT || st.phase1==-1) && !skeletonModes.contains(st.symbol)) {
			st.phase0 = 0.;									// append all other previous entries that overlap with current slide
			if (st.phase1 > endT) {
				st.phase1 = -1;
			} else {
				st.phase1 -= std::max(0,startT);
				if (st.phase1 < 0) st.phase1 = -1;
			}
			S.append(st);
		}

		// it is in skeleton or part of the last slide before the current horizon
		else if (se.phase0 > startT && se.phase1 <= endT) {
			se.phase0 -= std::max(0,startT);
			se.phase1 -= std::max(0,startT);
			if (se.phase0 == 0) continue;
			if (se.phase1 > endT || se.phase1 < 0) se.phase1 = -1;
			S.append(se);
		}
	}

	return S;
}

//===========================================================================
// this uses the horizon to optBound
void LGP_Node::optBound3(BoundType bound, bool collisions, intA window, int verbose) {
	if(komoProblem(bound)) komoProblem(bound).reset();
	komoProblem(bound) = make_shared<KOMO>();
	ptr<KOMO>& komo = komoProblem(bound);


	komo->verbose = rai::MAX(verbose, 0);

	if(komo->verbose>0) {
		cout <<"########## OPTIM lev " <<bound <<endl;
	}

	komo->logFile = new ofstream(OptLGPDataPath + STRING("komo-" <<id <<'-' <<step <<'-' <<bound));

	//Skeleton S = getSkeleton(false, 0, window.last()); 						//< this optimizes the entire sequence from the start
	Skeleton S = getNextHorizonSkeleton(window);							//< get skeleton of horizon and append previous conditions

	arrA waypoints;
	if(bound==BD_seqPath || bound==BD_seqVelPath) {
		CHECK(komoProblem(BD_seq), "BD_seq needs to be computed before");
		waypoints = komoProblem(BD_seq)->getPath_qAll();
	}

	auto comp = skeleton2Bound(komo, bound, S,
														 startKinematics,
														 collisions,
														 waypoints);

	CHECK(comp, "no compute object returned");

	if(komo->logFile) writeSkeleton(*komo->logFile, S, getSwitchesFromSkeleton(S, komo->world));

	if(komo->verbose>1) {
		writeSkeleton(cout, S, getSwitchesFromSkeleton(S, komo->world));
	}

	computes.append(comp);

	for(ptr<Objective>& o:tree->finalGeometryObjectives.objectives) {
		cout <<"FINAL objective: " <<*o <<endl;
		ptr<Objective> co = komo->addObjective({(double)(komo->T-1), (double)(komo->T-1)}, o->feat, {}, o->type);
		cout <<"FINAL objective: " <<*co <<endl;
	}

	if(komo->logFile) {
		komo->reportProblem(*komo->logFile);
		(*komo->logFile) <<komo->getProblemGraph(false);
	}

	//-- optimize
	DEBUG(FILE("z.fol") <<fol;);
	DEBUG(komo->getReport(false, 1, FILE("z.problem")););
	if(komo->verbose>1) komo->reportProblem();
	if(komo->verbose>5) komo->animateOptimization = komo->verbose-5;

	try {
		if(bound != BD_poseFromSeq) {
			if (bound == BD_seqPath && verbose>3) cout << "SKELETON FOR SEQ PATH: " << S << endl;
			komo->run();
		} else {
			CHECK_EQ(step, komo->T-1, "");
			NIY//komo->run_sub({komo->T-2}, {});
		}
	} catch(std::runtime_error& err) {
		cout <<"KOMO CRASHED: " <<err.what() <<endl;
		komoProblem(bound).reset();
		HALT("KOMO CRASHED!");
		return;
	}
	COUNT_kin += rai::Configuration::setJointStateCount;
	COUNT_opt(bound)++;
	COUNT_time += komo->timeTotal;
	count(bound)++;

	DEBUG(komo->getReport(false, 1, FILE("z.problem")););

	Graph result = komo->getReport((komo->verbose>0 && bound>=2));
	DEBUG(FILE("z.problem.cost") <<result;);
	double bound_cost = result.get<double>("sos");
	double bound_constraints = result.get<double>("eq");
	bound_constraints += result.get<double>("ineq");

	bool feas = (bound_constraints<2.5);

	if(komo->verbose>0) {
		cout <<"  RESULTS: cost: " <<bound_cost <<" constraints: " <<bound_constraints <<" feasible: " <<feas <<endl;
	}

	//-- post process komo problem for level==1
	if(bound==BD_pose) {
		bound_cost -= 0.1*ret.reward; //account for the symbolic costs
		if(parent) bound_cost += parent->cost(bound); //this is sequentially additive cost
	} /*else {
    cost_here += cost(BD_symbolic); //account for the symbolic costs
  }*/

	//-- read out and update bound
	//update the bound
	if(feas) {
		if(count(bound)==1 || bound_cost<highestBound) highestBound=bound_cost;
	}

	if(count(bound)==1 || bound_cost<cost(bound)) {
		cost(bound) = bound_cost;
		constraints(bound) = bound_constraints;
		feasible(bound) = feas;
		opt(bound) = komo->x;
		computeTime(bound) = komo->timeTotal;
	}

	if(!feasible(bound))
		labelInfeasible();
}

//===========================================================================
// overloading optBestOnLevel with horizon
void LGP_Tree::optBestOnLevel(BoundType bound, LGP_NodeL& drawFringe, BoundType drawFrom, LGP_NodeL* addIfTerminal, LGP_NodeL* addChildren, const intA window) { //optimize a seq
	if(!drawFringe.N) return;
	LGP_Node* n = popBest(drawFringe, drawFrom);
	if(n && !n->count(bound)) {
		try {
			// optBound3 is adapted to RHC
			n->optBound3(bound, collisions, window, verbose-2);
		} catch(const char* err) {
			LOG(-1) <<"opt(level=" <<bound <<") has failed for the following node:";
			n->write(cout, false, true);
			LOG(-3) <<"node optimization failed";
		}

		if(n->feasible(bound)) {
			if(addIfTerminal && n->isTerminal) addIfTerminal->append(n);
			if(addChildren) for(LGP_Node* c:n->children) addChildren->append(c);
		}
		// removed usage of path bound here
		else if(bound == BD_seqPath && !n->feasible(bound)) {							// use path bound if seq path does not work
			RAI_MSG("TRYING PATH BOUND");
			try {
				n->optBound3(BD_path, collisions, window, verbose-2);
			} catch(const char* err) {
				LOG(-1) <<"opt(level=" <<BD_path <<") has failed for the following node:";
				n->write(cout, false, true);
				LOG(-3) <<"node optimization failed";
			}
			if(n->feasible(BD_path)) {
				if(addIfTerminal && n->isTerminal) addIfTerminal->append(n);
				if(addChildren) for(LGP_Node* c:n->children) addChildren->append(c);
			}
		}
		focusNode = n;
	}
}

//===========================================================================
//overloading step with horizon
void LGP_Tree::step(int horizon, int windowN) {
	expandNext();

	uint numSol = fringe_solved.N;

	// optimize nodes
	optBestOnLevel(BD_seq, fringe_seq, BD_symbolic, &fringe_path, nullptr, {horizon*windowN, horizon*(windowN+1)});
	if(verbose>2 && fringe_path.N) cout <<"EVALUATING PATH " <<fringe_path.last()->getTreePathString(horizon*windowN, horizon*(windowN+1));
	optBestOnLevel(BD_seqPath, fringe_path, BD_seq, &fringe_solved, nullptr, {horizon*windowN, horizon*(windowN+1)});

	if(fringe_solved.N>numSol) {
		if(verbose>2) { cout <<"NEW SOLUTION UNTIL HORIZON FOUND! " <<fringe_solved.last()->getTreePathString(horizon*windowN, horizon*(windowN+1)); cout <<"LEN: " <<std::min((uint) horizon, fringe_solved.last()->getTreePath().N - horizon*windowN); cout <<endl; }
		solutions.set()->append(new LGP_Tree_SolutionData(*this, fringe_solved.last()));
		solutions.set()->sort(sortComp2);
		if(verbose>0) {
			BoundType bound;
			if (focusNode->komoProblem(BD_seqPath) && focusNode->feasible(BD_seqPath)) bound = BD_seqPath;
			else if(focusNode->komoProblem(BD_path) && focusNode->feasible(BD_path)) bound = BD_path;
			else HALT("NO KOMO FOUND");
			cout << "PRESS q TO START AND END THE VISUALIZATION" << endl;
			focusNode->komoProblem(bound)->view(true, "optimized motion");
			focusNode->komoProblem(bound)->view_play(true);
		}
	}

	//-- update queues (if something got infeasible)
	clearFromInfeasibles(fringe_expand);
	clearFromInfeasibles(fringe_pose);
	clearFromInfeasibles(fringe_poseToGoal);
	clearFromInfeasibles(fringe_seq);
	clearFromInfeasibles(fringe_path);
	clearFromInfeasibles(terminals);

	if(verbose>0) {
		rai::String out=report();
		fil <<out <<endl;
		cout <<out <<endl;
	}
	numSteps++;
}

//===========================================================================
// new version of run that performs init differently and calls step with optimization window
void LGP_Tree::run2(int windowN, int horizon, uint steps) {
	//init(); --- replaced by the lines below
	if (heuristicCosts) heuristicCosts(root);
	fringe_expand.append(focusNode);
	//fringe_seq.append(focusNode); 			// this can be skipped since root will always be optimized with seqBound in previous problem

	uint stopSol = rai::getParameter<double>("LGP/stopSol", 12);
	//double stopTime = rai::getParameter<double>("LGP/stopTime", 400.);

	for(uint k=0; k<steps; k++) {
		step(horizon, windowN); 						//< call step with horizon

		if(fringe_solved.N>=stopSol) break;
		//if(COUNT_time>stopTime) break;		//< count time is counting the entire opt time so we dont want this here
	}

	if(verbose>0) report(true);

	//basic output
	ofstream output(dataPath+"lgpopt");
	writeNodeList(output);
	output.close();

	if(verbose>1) views.clear();
}

//===========================================================================
// overloading getPathString in order to define a window of decisions we want
rai::String LGP_Node::getTreePathString(int from, uint to, char sep) const {
	LGP_NodeL path = getTreePath();
	rai::String str;
	for(int i=from; i<(int)std::min(path.N, to); ++i) {
		LGP_Node* b = path.elem(i);
		if(b->decision) str <<*b->decision <<sep;
	}
	return str;
}

//===========================================================================
// this sets up a new LGP tree, based on a previous one
void RHLGP_solver::setupLGP(LGP_Tree &tree, const char *priorDecisions) const {
	tree.fol.addTerminalRule(goals);
	tree.heuristicCosts = interfaceFct;
	tree.verbose = verbose;
	if (priorDecisions) tree.walkToNode(priorDecisions); 	// this adds the previous decisions to the fol of the new tree
}

//===========================================================================
// find out the highest bound that was optimized
BoundType getOptimizedBound(LGP_Node *n) {
	BoundType optimizedBound;
	optimizedBound = BD_seq;
	if (n->komoProblem(BD_path)){
		optimizedBound = BD_path;
	} else if(n->komoProblem(BD_seqPath)) {
		optimizedBound = BD_seqPath;
	}
	return optimizedBound;
}

//===========================================================================
// gets the node at end of horizon
LGP_Node* RHLGP_solver::horizonNode(LGP_Tree &lgp, int i) {
	return lgp.fringe_solved.last()->getTreePath().elem(std::min((uint) i*horizon, lgp.fringe_solved.last()->getTreePath().N)-1);
}

//===========================================================================
void RHLGP_solver::reset() {
	totalExpansions = 0;
	solutionLen = 0;
	komo = make_shared<KOMO>();
}

//===========================================================================
// this one runs the RHC optimization
// 1. run LGP -- if sequence is solution, optimize in slices as long as it is feasible
// 2. return the endconfig of the last feasible step
// 3. run next lgp instance with new config and same goals
void RHLGP_solver::optimize(ptr<OpenGL> gl) {
	rai::String solution;
	bool solved = false;
	LGP_Node *optimizedNode;
	rai::Configuration nextConfig = C; // save config statically
	reset();

	// loop over horizons until we reached our goal
	int i = 1;
	while(!solved) {
		if (verbose>1) cout << "STARTING ITERATION: " << i << endl;
		LGP_Tree lgp(nextConfig, folFile);									// setup and run
		setupLGP(lgp, solution.p);
		lgp.run2(i-1, horizon, 3000000);

		// extract solutions
		CHECK(lgp.fringe_solved.N, "FRINGE SOLVED HAS TO CONTAIN A VALUE");
		optimizedNode = lgp.fringe_solved.last();
		solution << optimizedNode->getTreePathString(horizon*(i-1), horizon*i) << " ";
		solutionLen = optimizedNode->step;
		BoundType optimizedBound = getOptimizedBound(optimizedNode);
		komo.reset();
		komo = optimizedNode->komoProblem(optimizedBound);
		getStats(optimizedBound, komo);

		getEndConfig(nextConfig, komo);
		solved = horizonNode(lgp, i)->isTerminal;						// we are done if the last node of the optimized sequence satisfies our goals
		totalExpansions += lgp.numSteps;
		i++;
	}

	cout <<endl<<"SOLUTION SEQ: " << solution << endl;
	cout <<"OVERALL RESULTS ===> " << "SOLUTION LEN: " << solutionLen << "; #steps: "<< i-1 << "; #OF EVALS: " << totalExpansions << "; #TREE NODES: " << COUNT_node << "; TOTAL TIME: " << COUNT_time <<endl<<endl;
}
