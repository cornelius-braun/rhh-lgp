frame world { shape:ssBox, size:[8 8 0.2 0.001], contact:1,
                       X:<t(0. 0. 0.0) d(0 1 0 0)>,
                       logical:{ object, base }  }

#box
frame box{ X:<t(0 0 .74)> }

# TODO: maybe put table legs back in

#base
frame base (box){ Q:<t(0 -.23 .10)>, contact:1 }
frame (base){ Q:<t(.01 .0  -.04) > shape:ssBox size:[6.12 .08 .08 .01] color:[.6 .6 .6], contact:1 }
frame (base){ Q:<t(.0 -.12 -.04) > shape:ssBox size:[6.12 .08 .08 .01] color:[.6 .6 .6], contact:1 }


#table
frame table1(world) { Q:<t(1.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .3 .2], contact:1, collision:1, logical:{tray}}
frame table2(world) { Q:<t(.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .3 .2], contact:1, collision:1, logical:{tray}}
frame table3(world) { Q:<t(-.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .3 .2], contact:1, collision:1, logical:{tray}}
frame table4(world) { Q:<t(-1.5 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[0. 1. 0.], contact:1, collision:1}
frame goal(table4) { Q:<t(0. 0. .02)> shape:ssBox size:[.2 .2 .001 .005] color:[0. 1. 0.], contact:1, collision:1, logical:{tray, target}}


Prefix = "L_"
Include='panda/panda.g'

Prefix = "R_"
Include='panda/panda.g'

Prefix = "T_"
Include='panda/panda.g'

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

frame endeffL_fingerL (L_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }
frame endeffL_fingerR (L_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }

frame endeffR_fingerL (R_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }
frame endeffR_fingerR (R_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }

frame endeffT_fingerL (T_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }
frame endeffT_fingerR (T_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }
