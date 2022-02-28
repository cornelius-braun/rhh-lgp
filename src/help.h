#pragma once
#include <Kin/kin.h>
#include <Kin/F_qFeatures.h>
#include <KOMO/komo.h>
#include <LGP/LGP_tree.h>
#include <Gui/opengl.h>

enum ManipulationTask {
		MT_climb,
		MT_climb_single,
		MT_complex,
		MT_mobileManipulator,
		MT_obstacle,
		MT_panda
};

enum HeuristicFct {
		NONE,
		ACTION_HEURISTICS,
		SEQ_BOUND
};

ptr<OpenGL> setupCamera();

void createRandomScene(rai::Configuration& C, uint numObj=4, const char* file="scenarios/empty_scene.g", int numCrawlers=2);

void createRandomScene(rai::Configuration& C, uint numObj=4, double zDiff=.9, double zOffset=0., const char* file="scenarios/empty_scene.g");

void createShelfScene(rai::Configuration& C, uint numObj=4);

void createObstacleParcour(rai::Configuration& C, uint numObj);

void createTableScene(rai::Configuration& C, uint numObj);

/* converts a string to an int to use strings in switches */
constexpr unsigned int str2int(const char* str, int h = 0) { return !str[h] ? 5381 : (str2int(str, h+1) * 33) ^ str[h];}