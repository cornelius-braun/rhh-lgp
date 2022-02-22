//
// Created by cornelius on 22.02.22.
//
#include <LGP/LGP_tree.h>
#include <Kin/kin.h>
#include "objectHandling.h"
#include "src/help.h"

rai::String decSeq = "(grasp endeffR banana)";

void objectHandling() {
	rai::Configuration C;
	C.clear();
	C.addFile("robotModels/pandaStation.g");
	C.addFile("scenarios/tableScene.g");
	C.optimizeTree();

	ptr<OpenGL> gl = setupCamera();

	LGP_Tree lgp(C, "fol/fol.g");
	LGP_Node *node = lgp.walkToNode(decSeq);

	/*BoundType bound = BD_seq;
	node->optBound(bound, true, 1);
	node->displayBound(gl, bound);*/

	BoundType bound = BD_path;
	node->optBound(bound, true, 1);
	node->displayBound(gl, bound);
}
