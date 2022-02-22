frame world { X:<t(0 0 0)> }

#box
frame box{ X:<t(0 0 .74)> }

# TODO: maybe put table legs back in

#base
frame base (box){ Q:<t(0 -.23 .10)> }
frame (base){ Q:<t(.01 .0  -.04) > shape:ssBox size:[6.12 .08 .08 .01] color:[.6 .6 .6] }
frame (base){ Q:<t(.0 -.12 -.04) > shape:ssBox size:[6.12 .08 .08 .01] color:[.6 .6 .6] }


#table
frame table1(world){ Q:<t(.8 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .3 .2] contact logical:{tableS}}
frame table2(world){ Q:<t(-.2 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .3 .2] contact logical:{tableS}}
frame table3(world){ Q:<t(-1.2 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[.4 .3 .2] contact logical:{tableS}}
frame goal(world){ Q:<t(-2.2 .25 .8)> shape:ssBox size:[.7 .7 .018 .005] color:[0. 1. 0.] contact logical:{goal}}


Prefix = "L_"
Include='panda/panda.g'

Prefix = "R_"
Include='panda/panda.g'

Prefix = "3_"
Include='panda/panda.g'

Edit L_panda_link0 (base) { joint:rigid Q:<t(-.7 0 0) d(90 0 0 1)> }
Edit R_panda_link0 (base) { joint:rigid Q:<t( .3 0 0) d(90 0 0 1)> }
Edit 3_panda_link0 (base) { joint:rigid Q:<t( -1.7 0 0) d(90 0 0 1)> }

Edit L_panda_joint2 { q= -.5 }
Edit R_panda_joint2 { q= -.5 }
Edit 3_panda_joint2 { q= -.5 }

Edit L_panda_leftfinger_1 { visual!, noVisual }
Edit L_panda_rightfinger_1 { visual!, noVisual }
Edit R_panda_leftfinger_1 { visual!, noVisual }
Edit R_panda_rightfinger_1 { visual!, noVisual }
Edit 3_panda_leftfinger_1 { visual!, noVisual }
Edit 3_panda_rightfinger_1 { visual!, noVisual }

frame endeffR (R_panda_hand_1) { Q:<t(0 0 .103) d(180 1 0 0) d(-90 0 0 1)> shape:marker size:[.02] color:[1 1 0] logical:{gripper}}
frame endeffL (L_panda_hand_1) { Q:<t(0 0 .103) d(180 1 0 0) d(-90 0 0 1)> shape:marker size:[.02] color:[1 1 0] logical:{gripper}}

frame endeffL_fingerL (L_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }
frame endeffL_fingerR (L_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }

frame endeffR_fingerL (R_panda_rightfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }
frame endeffR_fingerR (R_panda_leftfinger_1) { Q:<t(0 0 0.0446) d(180 1 0 0) d(90 0 0 1)> shape:marker size:[.02] color:[0 0 1] }
