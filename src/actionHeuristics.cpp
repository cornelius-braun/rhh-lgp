#include "actionHeuristics.h"

/* the length and sizes of the objects that we used */
double CRAWLER_LEN = 1.5;
double TEST_OBJECT_LEN = .2;
double MOBILE_BASE_LEN = .3;

////===========================================================================
arr getSupportPosition(LGP_Node* n, const char *effector) {
	arr position;
	std::string state = STRING(*n->folState).p;
	const std::regex r("(on )(\\w+)( " + STRING(effector) + ")");
	std::smatch m;
	regex_search(state, m, r);
	if (STRING(m[2])) position = n->startKinematics.getFrame(STRING(m[2]))->getPosition();
	return position;
}

////===========================================================================
// not used in the current version, but still useful
rai::String getSupportObject(LGP_Node* n, const char *effector) {
	rai::String position = STRING("");
	std::string state = STRING(*n->folState).p;
	const std::regex r("(on )(\\w+)( " + STRING(effector) + ")");
	std::smatch m;
	regex_search(state, m, r);
	if (STRING(m[2]).N) position << STRING(m[2]);
	return position;
}

////===========================================================================
// this works for walker as for each step we encode from where we take the step
arr getPosFromDecision(LGP_Node* n, const FOL_World::Decision* decision) {
	rai::String object = decision->substitution.elem(-2)->key;
	return n->startKinematics.getFrame(object)->getPosition();
}

////===========================================================================
// DEPRECATED
StringA getNearbyObjects(LGP_Node* n, const FOL_World::Decision* decision, double numberOfWalkers) {
	doubleA walkerReach = {0, CRAWLER_LEN, 2*CRAWLER_LEN, 2*CRAWLER_LEN+TEST_OBJECT_LEN};
	StringA nearbyObjects;
	arr position = getPosFromDecision(n, decision);
	if (length(position) != 0){
		for(rai::Frame *f : n->startKinematics.frames){
			if (euclideanDistance(f->getPosition(), position) <= walkerReach.elem(numberOfWalkers)) nearbyObjects.append(f->name);
		}
	}
	return nearbyObjects;
}

////===========================================================================
arr getWalkerPosition(LGP_Node *n, const char* effector) {
	arr pos = getSupportPosition(n, STRING(*effector << "_handA").p);
	if (pos.N == 0) pos = getSupportPosition(n, STRING(*effector << "_handB").p);
	return pos;
}

//===========================================================================
double getStepSize(LGP_Node *n, const FOL_World::Decision* decision, const char *target) {
	return euclideanDistance(n->startKinematics.getFrame(decision->substitution.last()->key)->getPosition(),n->startKinematics.getFrame(target)->getPosition())
				 - euclideanDistance(n->startKinematics.getFrame(decision->substitution.elem(-2)->key)->getPosition(),n->startKinematics.getFrame(target)->getPosition());
}

//===========================================================================
bool reachabilityCheck(LGP_Node *n, const FOL_World::Decision* decision, arr targetPos) {
	/* we are connected to mobile base */
	rai::String state = STRING(*n->folState);
	if (state.contains((STRING("onMobile")))) {
		return (targetPos.last() <= CRAWLER_LEN+MOBILE_BASE_LEN); // add the height of the mobile base
	}

	// else we are not connected to mobile base
	// get our own position
	arr effectorPos;
	int numWalkers = (state.contains("connected")) ? 2 : 1;
	arr posL = getWalkerPosition(n, STRING("L").p);
	arr posR = getWalkerPosition(n, STRING("R").p);
	if (posL.N == 0) posL = posR;
	if (posR.N == 0) posR = posL;
	if (decision->substitution.elem(-2)->key == "L_handA") { effectorPos = posL; }
	else effectorPos = posR; // if we are not L_handA the we are right effector

	return euclideanDistance(effectorPos, targetPos) <= numWalkers*CRAWLER_LEN;
}

//===========================================================================
bool pandaReachability() {
	// TODO
}

//===========================================================================
double stepHeuristic(LGP_Node *n, const FOL_World::Decision* decision, const char *target, int numberOfWalkers) {
	arr targetPos = n->startKinematics.getFrame(decision->substitution.last()->key)->getPosition();
	return euclideanDistance(getPosFromDecision(n, decision), targetPos) <= numberOfWalkers*CRAWLER_LEN ? getStepSize(n, decision, target) : 1000;
}


//===========================================================================
double placeHeuristic(LGP_Node *n, const FOL_World::Decision* decision, const char *target) {
	arr targetPos = n->startKinematics.getFrame(decision->substitution.last()->key)->getPosition();
	if (!reachabilityCheck(n, decision, targetPos)) return 1000;
	return (decision->substitution.last()->key == target) ? -1 : 0;
}

//===========================================================================
double disconnectHeuristic(LGP_Node *n, const FOL_World::Decision* decision) {
	if (n->parent->decision) {
		const FOL_World::Decision* parentDecision = std::dynamic_pointer_cast<const FOL_World::Decision>(n->parent->decision).get();
		return (parentDecision->rule->key == "connect") ? 1000 : 0;
	}
	else {
		return 0;
	}
}

//===========================================================================
double connectHeuristic(LGP_Node *n, const FOL_World::Decision* decision) {
	// dont connect right after disconnecting
	if (n->parent->decision) {
		const FOL_World::Decision* parentDecision = std::dynamic_pointer_cast<const FOL_World::Decision>(n->parent->decision).get();
		if (parentDecision->rule->key == "disconnect") return 1000;
	}
	// check if the walkers are reachable
	arr targetPos = n->startKinematics.getFrame(decision->substitution.last()->key)->getPosition();
	return reachabilityCheck(n, decision, targetPos) ? 0 : 1000;
}

//===========================================================================
double graspHeuristic(LGP_Node *n, const FOL_World::Decision* decision, bool panda=false) {
	arr targetPos = n->startKinematics.getFrame(decision->substitution.last()->key)->getPosition();
	if (panda) { return pandaReachability(n, decision, targetPos) ? 0 : 1000; } // TODO: adapt
	return reachabilityCheck(n, decision, targetPos) ? 0 : 1000;
}