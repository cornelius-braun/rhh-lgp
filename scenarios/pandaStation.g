frame world { shape:ssBox, size:[8 8 0.2 0.001], contact:1,
                       X:<t(0. 0. 0.0) d(0 1 0 0)> }

#box
frame box{ X:<t(0 0 .74)> }

# TODO: maybe put table legs back in
# bodenstreben
frame (box){ Q:<t( .54 0 -.02)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(-.54 0 -.02)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t( .54 0 -.52)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(-.54 0 -.52)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }

# bodenstreben
frame (box){ Q:<t( 1.5 0 -.02)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(-1.5 0 -.02)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t( 1.5 0 -.52)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(-1.5 0 -.52)> shape:ssBox size:[.04 .78 .08 .01] color:[.6 .6 .6] }

# long sides
frame (box){ Q:<t(0 -.41 -.02)> shape:ssBox size:[4.04 .04 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(0  .41 -.02)> shape:ssBox size:[4.04 .04 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(0  .41 -.52)> shape:ssBox size:[4.04 .04 .08 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(0 -.41 -.52)> shape:ssBox size:[4.04 .04 .08 .01] color:[.6 .6 .6] }

frame (box){ Q:<t(-.54 -.41 -.17)> shape:ssBox size:[.04 .04 .78 .01] color:[.6 .6 .6] }
frame (box){ Q:<t( .54 -.41 -.17)> shape:ssBox size:[.04 .04 .78 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(-.54  .41 -.27)> shape:ssBox size:[.04 .04 .58 .01] color:[.6 .6 .6] }
frame (box){ Q:<t( .54  .41 -.27)> shape:ssBox size:[.04 .04 .58 .01] color:[.6 .6 .6] }

frame (box){ Q:<t(-.54 -.41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }
frame (box){ Q:<t( .54  .41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }
frame (box){ Q:<t(-.54  .41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }
frame (box){ Q:<t( .54 -.41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }

frame (box){ Q:<t(-1.5 -.41 -.17)> shape:ssBox size:[.04 .04 .78 .01] color:[.6 .6 .6] }
frame (box){ Q:<t( 1.5 -.41 -.17)> shape:ssBox size:[.04 .04 .78 .01] color:[.6 .6 .6] }
frame (box){ Q:<t(-1.5  .41 -.27)> shape:ssBox size:[.04 .04 .58 .01] color:[.6 .6 .6] }
frame (box){ Q:<t( 1.5  .41 -.27)> shape:ssBox size:[.04 .04 .58 .01] color:[.6 .6 .6] }

# legs
frame (box){ Q:<t(-1.5 -.41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }
frame (box){ Q:<t( 1.5  .41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }
frame (box){ Q:<t(-1.5  .41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }
frame (box){ Q:<t( 1.5 -.41 -.63)> shape:cylinder size:[.04 .04 .14 .05] color:[.6 .6 .6] }



#base
frame base (box){ Q:<t(0 -.23 .10)>, contact:1 }
frame (base){ Q:<t(.01 .0  -.04) > shape:ssBox size:[4.12 .08 .08 .01] color:[.6 .6 .6], contact:1 }
frame (base){ Q:<t(.0 -.12 -.04) > shape:ssBox size:[4.12 .08 .08 .01] color:[.6 .6 .6], contact:1 }


#table
frame table1(world) { Q:<t(1.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .4 .4], contact:1, collision:1, logical:{tray}}
frame table2(world) { Q:<t(.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .4 .4], contact:1, collision:1, logical:{tray}}
frame table3(world) { Q:<t(-.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .4 .4], contact:1, collision:1, logical:{tray}}
frame goal(world) { Q:<t(-1.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[0. 1. 0.], contact:1, collision:1, logical:{tray, target}}


Prefix = "L_"
Include='../robotModels/panda/panda.g'

Prefix = "R_"
Include='../robotModels/panda/panda.g'

Prefix = "T_"
Include='../robotModels/panda/panda.g'

Edit L_panda_link0 (base) { joint:rigid Q:<t(0. 0. 0.) d(90 0 0 1)> }
Edit R_panda_link0 (base) { joint:rigid Q:<t( 1. 0 0) d(90 0 0 1)> }
Edit T_panda_link0 (base) { joint:rigid Q:<t( -1. 0 0) d(90 0 0 1)> }

Edit L_panda_joint2 { q= -.5 }
Edit R_panda_joint2 { q= -.5 }
Edit T_panda_joint2 { q= -.5 }

Edit L_panda_leftfinger_1 { visual!, noVisual }
Edit L_panda_rightfinger_1 { visual!, noVisual }
Edit R_panda_leftfinger_1 { visual!, noVisual }
Edit R_panda_rightfinger_1 { visual!, noVisual }
Edit T_panda_leftfinger_1 { visual!, noVisual }
Edit T_panda_rightfinger_1 { visual!, noVisual }

frame endeffR (R_panda_hand_1) { Q:<t(0 0 .103) d(180 1 0 0) d(-90 0 0 1)> shape:marker size:[.02] color:[1 1 0] logical:{gripper}}
frame endeffL (L_panda_hand_1) { Q:<t(0 0 .103) d(180 1 0 0) d(-90 0 0 1)> shape:marker size:[.02] color:[1 1 0] logical:{gripper}}
frame endeffT (T_panda_hand_1) { Q:<t(0 0 .103) d(180 1 0 0) d(-90 0 0 1)> shape:marker size:[.02] color:[1 1 0] logical:{gripper}}

frame endeffL_fingerL (L_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] contact:1 collision:1 color:[0 0 1] }
frame endeffL_fingerR (L_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] contact:1 collision:1 color:[0 0 1] }

frame endeffR_fingerL (R_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] contact:1 collision:1 color:[0 0 1] }
frame endeffR_fingerR (R_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] contact:1 collision:1 color:[0 0 1] }

frame endeffT_fingerL (T_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] contact:1 collision:1 color:[0 0 1] }
frame endeffT_fingerR (T_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] contact:1 collision:1 color:[0 0 1] }
