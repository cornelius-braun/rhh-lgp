//
// Created by Cornelius Braun on 21.07.21.
//

#include "LGP/LGP_tree.h"
#include "LGP/bounds.h"
#include "KOMO/komo.h"
#include "Kin/kin.h"

#ifndef MANIPULATIONPLANNING_RHHLGP_H
#define MANIPULATIONPLANNING_RHHLGP_H

struct RHHLGP_solver{
		RHHLGP_solver(rai::Configuration &C, uint horizon, std::function<void(LGP_Node *n)> interfaceFct, const char* goals, 	const char * folFileName, int verbose):
		C(C), horizon(horizon), verbose(verbose), goals(goals), folFile(folFileName),
		interfaceFct(interfaceFct), totalExpansions(0), solutionLen(0), komo(make_shared<KOMO>()) {};

		rai::Configuration &C;
		int horizon;
		int verbose;
		const char *goals;
		const char *folFile;
		std::function<void(LGP_Node *n)> interfaceFct;
		int totalExpansions;
		int solutionLen;
		shared_ptr<KOMO> komo;

		void reset();
		void optimize(ptr<OpenGL> gl);
		void setupLGP(LGP_Tree &tree, const char *priorDecisions= nullptr) const;
		LGP_Node* horizonNode(LGP_Tree &lgp, int i);
		void getStats(BoundType bound, shared_ptr<KOMO> komo);
};

void getEndConfig(rai::Configuration &C, shared_ptr<KOMO> komo);


#endif //MANIPULATIONPLANNING_RHHLGP_H
