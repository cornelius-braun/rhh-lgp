//
// Created by cornelius on 22.02.22.
//
#include <LGP/LGP_tree.h>
#include <Kin/kin.h>
#include "objectHandling.h"
#include "src/help.h"

rai::String decSeq = "(grasp endeffR obj0) (place endeffR obj0 table2) (grasp endeffL obj0) (place endeffL obj0 table3) (grasp endeffT obj0) (place endeffT obj0 goal)";

void createTableScene(rai::Configuration& C, uint numObj) {
	for(;;){
		C.clear();
		C.addFile("robotModels/pandaStation.g");
		//C.addFile("scenarios/tableScene.g");
		C.optimizeTree();
		for(uint i=0; i<numObj; i++){
			rai::Frame *f = C.addFrame(STRING("obj"<<i), "table1", "type:ssBox size:[.08, .08, .15, .02], contact:1, collisions:-1, color:[1.,0.,0.], logical={ object:True, grippable }, joint=rigid" );
			f->setRelativePosition({(rnd.uni(-.2, .2)), rnd.uni(-.2,.2), .1});
		}
		C.stepSwift();
		arr g, J;
		C.kinematicsPenetration(g, J);
		if(g.scalar()==0.) break;
	}
	C.proxies.clear();
}

void objectHandling() {
	rai::Configuration C;
	/*C.clear();
	C.addFile("robotModels/pandaStation.g");
	C.addFile("scenarios/tableScene.g");
	C.optimizeTree();*/
	int numObj = 3;
	createTableScene(C, numObj);

	ptr<OpenGL> gl = setupCamera();

	/*rai::String terminal;
	for (int i = 0; i < numObj; ++i) {terminal << "(on goal obj" <<i << ") ";}*/

	LGP_Tree lgp(C, "fol/fol.g");
	LGP_Node *node = lgp.walkToNode(decSeq);

	/*BoundType bound = BD_seq;
	node->optBound(bound, true, 1);
	node->displayBound(gl, bound);*/

	BoundType bound = BD_path;
	node->optBound(bound, true, 1);
	node->displayBound(gl, bound);
}
