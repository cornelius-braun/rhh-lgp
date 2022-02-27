#include <KOMO/komo.h>
#include <LGP/LGP_tree.h>
#include "actionHeuristics.h"
#include "help.h"
#include <limits>

#ifndef MANIPULATIONPLANNING_COSTTOGO_H
#define MANIPULATIONPLANNING_COSTTOGO_H

void costToGo1And2(LGP_Node* n, rai::String target, StringA effectors, int numTargets);

void costToGo3(LGP_Node *n, StringA targets, char *effector);

void costToGo4(LGP_Node* n, int numObjects, rai::String source, rai::String target);

void costToGo5(LGP_Node* n, rai::String source, rai::String target);

void costToGo6(LGP_Node* n, int numObjects, rai::String target);

#endif //MANIPULATIONPLANNING_COSTTOGO_H
