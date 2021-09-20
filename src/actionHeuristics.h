//
// Created by cornelius on 17.06.21.
//

#ifndef MANIPULATIONPLANNING_ACTIONHEURISTICS_H
#define MANIPULATIONPLANNING_ACTIONHEURISTICS_H

#include <Kin/kin.h>
#include <Kin/F_qFeatures.h>
#include <KOMO/komo.h>
#include <LGP/LGP_tree.h>
#include <regex>

/* get the position of the frame that the walker is currently standing on */
arr getSupportPosition(LGP_Node* n, const char *effector);

/* get name of the frame that the walker is currently standing on */
rai::String getSupportObject(LGP_Node* n, const char *effector);

/* gets the position of an object that cannot be moved */
arr getPosFromDecision(LGP_Node* n, const FOL_World::Decision* decision);

/* get all objects that are within the distance of one or several crawlers */
// DEPRECATED: I previously used it in step heuristic. Now everything is in reachability check
StringA getNearbyObjects(LGP_Node* n, const FOL_World::Decision* decision, double numberOfWalkers);

/* this gets the position of a walker based on the effector name, e.g. L_handA or B*/
arr getWalkerPosition(LGP_Node *n, const char* effector);

/* this returns how much we approach the target with a step; negative if we approach and positive if we walk away */
double getStepSize(LGP_Node *n, const FOL_World::Decision* decision, const char *target);

/* this tests if a walker can make a movement from base to target somehow */ //-- only used in other version
bool testReach(rai::Frame *base, rai::Frame *target, double crawlerLen);

/* this checks if a walker has an object within reach for grasping and placing */
bool reachabilityCheck(LGP_Node *n, const FOL_World::Decision* decision, arr targetPos);

/* this makes the robots walk to the target if not connected; once the placed something they are close enough to connect */
double stepHeuristic(LGP_Node *n, const FOL_World::Decision* decision, const char *target, int numberOfWalkers);

/* only try to place on the target region, we place, else not */
double placeHeuristic(LGP_Node *n, const FOL_World::Decision* decision, const char *target);

/* prune disconnections when not on the tray or when last decision was to connect */
double disconnectHeuristic(LGP_Node *n, const FOL_World::Decision* decision);

double connectHeuristic(LGP_Node *n, const FOL_World::Decision* decision);

/* prune grasping of objects that are too far */
double graspHeuristic(LGP_Node *n, const FOL_World::Decision* decision);

#endif //MANIPULATIONPLANNING_ACTIONHEURISTICS_H
