//
// Created by cornelius on 10.07.21.
//
#include "costToGo.h"

//===========================================================================
// heuristic for random walk to target
void costToGo1And2(LGP_Node* n, rai::String target, StringA effectors, int numTargets) {
	// use min over all crawlers
	double initDist = std::numeric_limits<int>::max(); // start with dist at infinity
	for (rai::String eff : effectors) {
		double dist = euclideanDistance(n->startKinematics.getFrame(target)->getPosition(), n->startKinematics.getFrame(eff)->getPosition());
		if (dist < initDist) initDist = dist;
	}

	// only set initDist for first decision
	if (n->step == 0) {
		n->cost(BD_symbolic) = numTargets * initDist;
		return;
	}
	// now we are not at root
	const FOL_World::Decision* decision = std::dynamic_pointer_cast<const FOL_World::Decision>(n->decision).get();
	n->cost(BD_symbolic) = n->parent->cost(BD_symbolic);  // base computations on parent costs

	// use decision heuristics that leverage geometric information
	switch (str2int(decision->rule->key)) {
		case str2int("step"): n->cost(BD_symbolic) += stepHeuristic(n, decision, STRING(target).p, 1); break;

			// if you can, connect is good
		case str2int("connect"): n->cost(BD_symbolic) += connectHeuristic(n, decision) - 1.5; break;

			// always go to the tray if connected
		case str2int("steptogether"): n->cost(BD_symbolic) += stepHeuristic(n, decision, STRING(target).p, 2); break;

			// dont disconnect until we are on the tray and not if we just connected
		case str2int("disconnect"): n->cost(BD_symbolic) += disconnectHeuristic(n, decision); break;

			// dont grasp if it is too far away
		case str2int("grasp"): n->cost(BD_symbolic) += graspHeuristic(n, decision); break;
	};
}

//===========================================================================
void costToGo3(LGP_Node *n, StringA targets, char *effector) {
	// only set initDist for first decision
	// init distance is the min of the distance of both crawlers to the target
	if (n->step == 0) {
		n->cost(BD_symbolic) = euclideanDistance(n->startKinematics.getFrame(STRING("R_handA"))->getPosition(), n->startKinematics.getFrame(STRING(effector))->getPosition())
													 + std::min(euclideanDistance(n->startKinematics.getFrame(targets.elem(0))->getPosition(), n->startKinematics.getFrame(STRING(effector))->getPosition()),
																			euclideanDistance(n->startKinematics.getFrame(targets.elem(1))->getPosition(), n->startKinematics.getFrame(STRING(effector))->getPosition()));
		return;
	}
	// now we are not at root
	n->cost(BD_symbolic) = n->parent->cost(BD_symbolic);  // base computations on parent costs
	const FOL_World::Decision* decision = std::dynamic_pointer_cast<const FOL_World::Decision>(n->decision).get();


	switch (str2int(decision->rule->key)) {
		case(str2int("step")): {
			// TODO: check if we should not take parent of n here
			rai::String otherCrawler = "R";																																				// figure out where the other crawler is
			if (decision->substitution.elem(-3)->key.getFirstN(1) == STRING("R")) otherCrawler = "L";
			rai::String supportObject = getSupportObject(n->parent, STRING(otherCrawler << "_handA"));
			if (!supportObject.N) supportObject = getSupportObject(n->parent, STRING(otherCrawler << "_handB"));
			n->cost(BD_symbolic) += stepHeuristic(n, decision, supportObject, 1);								// use that position as target for walker
		} break;

			// always walk to the targets if connected
		case str2int("steptogether"): {
			n->cost(BD_symbolic) += std::min(stepHeuristic(n, decision, STRING(targets.elem(0)), 2), stepHeuristic(n, decision, STRING(targets.elem(1)), 2));
		} break;

			// dont grasp the object is out of reach it is too far away
			// problem specific info: only grasp our targets
		case str2int("grasp"): n->cost(BD_symbolic) += graspHeuristic(n, decision); break;

			// I took away connect because this makes it faster
			// if you can, connect is good -- sometimes disconnect after connect is actually good for stability
		case str2int("connect"): n->cost(BD_symbolic) += connectHeuristic(n, decision); break;

			// dont disconnect just after connecting -- sometimes connect after disconnect is actually good for stability
		case str2int("disconnect"): n->cost(BD_symbolic) += disconnectHeuristic(n, decision); break;
	};
}

//===========================================================================
void costToGo4(LGP_Node* n, int numObjects, rai::String source, rai::String target) {
	double initDist = euclideanDistance(n->startKinematics.getFrame(source)->getPosition(), n->startKinematics.getFrame(target)->getPosition());
	// only set initDist for first decision
	if (n->step == 0) {
		n->cost(BD_symbolic) = numObjects * initDist;
		return;
	}
	// now we are not at root
	n->cost(BD_symbolic) = n->parent->cost(BD_symbolic);  // base computations on parent costs
	const FOL_World::Decision* decision = std::dynamic_pointer_cast<const FOL_World::Decision>(n->decision).get();

	// use decision heuristics that leverage geometric information
	switch (str2int(decision->rule->key)) {
		// we incentivize connect and connecting to the mobile base equally
		case str2int("connect2mobile"): n->cost(BD_symbolic) -= 0.; break;
		case str2int("connect"): n->cost(BD_symbolic) += connectHeuristic(n, decision); break;

			// only place on target
		case str2int("place"): n->cost(BD_symbolic) += placeHeuristic(n, decision, target); break;

			// dont disconnect until we are on the tray and not if we just connected
		case str2int("disconnect"): n->cost(BD_symbolic) += disconnectHeuristic(n, decision); break;

			// check if connected to mobile base -- if yes, then we skip this heuristic because we can move freely
		case str2int("grasp"): n->cost(BD_symbolic) += graspHeuristic(n, decision); break;
	};
}


//===========================================================================
void costToGo5(LGP_Node* n, rai::String source, rai::String target) {
	double initDist = euclideanDistance(n->startKinematics.getFrame(source)->getPosition(), n->startKinematics.getFrame(target)->getPosition());
	// only set initDist for first decision
	if (n->step == 0) {
		n->cost(BD_symbolic) = initDist;
		return;
	}
	// now we are not at root
	n->cost(BD_symbolic) = n->parent->cost(BD_symbolic);  // base computations on parent costs
	const FOL_World::Decision* decision = std::dynamic_pointer_cast<const FOL_World::Decision>(n->decision).get();

	// use decision heuristics that leverage geometric information
	switch (str2int(decision->rule->key)) {
		case str2int("step"): n->cost(BD_symbolic) += stepHeuristic(n, decision, STRING(target).p, 1); break;

		// check if connected to mobile base -- if yes, then we skip this heuristic because we can move freely
		case str2int("grasp"): n->cost(BD_symbolic) += graspHeuristic(n, decision); break;
	};
}

//===========================================================================
void costToGo6(LGP_Node* n, int numObjects, rai::String source, rai::String target) {
	double initDist = 4; //euclideanDistance(n->startKinematics.getFrame(source)->getPosition(), n->startKinematics.getFrame(target)->getPosition());
	// only set initDist for first decision
	if (n->step == 0) {
		n->cost(BD_symbolic) = numObjects * initDist;
		return;
	}
	// now we are not at root
	n->cost(BD_symbolic) = n->parent->cost(BD_symbolic);  // base computations on parent costs
	const FOL_World::Decision* decision = std::dynamic_pointer_cast<const FOL_World::Decision>(n->decision).get();

	// use decision heuristics that leverage geometric information
	switch (str2int(decision->rule->key)) {
		// we incentivize connect and connecting to the mobile base equally
		// only place on target
		case str2int("place"): n->cost(BD_symbolic) += placeHeuristic(n, decision, target); break;

		// check if connected to mobile base -- if yes, then we skip this heuristic because we can move freely
		case str2int("grasp"): n->cost(BD_symbolic) += graspHeuristic(n, decision); break;
	};
}

//===========================================================================
// this is following Quim's idea of using the seqBound as a heuristic
void LGP_Tree::seqBoundCostToGo(LGP_Node *node) {
	// opt seq bound
	BoundType bound = BD_seq;
	LGP_NodeL *addIfTerminal = &fringe_path;

	if(node && !node->count(bound)) {
		try {
			// optBound is the classic and unchanged implementation
			node->optBound(bound, true, -1);
		} catch(const char* err) {
			LOG(-1) <<"opt(level=" <<bound <<") has failed for the following node:";
			node->write(cout, false, true);
			LOG(-3) <<"node optimization failed";
		}

		// now if the seqBound is feasible, then we push it to the next queue, and we use constraints as heuristic
		// otherwise, optBound labeled it infeasible, and we prune it with the costs of 1000
		if(node->feasible(bound)) {
			// addIfTerminal is fringePath when we call it in main
			if(addIfTerminal && node->isTerminal) addIfTerminal->append(node);
			node->cost(BD_symbolic) = node->constraints(bound);
		} else {
			node->cost(BD_symbolic) = 1000;
		}
		focusNode = node;
	}
}

