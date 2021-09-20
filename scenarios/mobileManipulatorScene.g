base 	{  shape:ssBox, size:[8 8 0.2 0.001], contact:1,
         X:<t(0. 0. 0.0) d(0 1 0 0)>,
         logical:{ object, base } }

# this is the mobile base
_plate (base) { X:<t (0 0 .25)> }
_mobileBase (_plate){shape:ssBox color:[.5 .81 .88] size:[.3 .3 .3 .05] contact:1 joint:transXYPhi } # the contact makes the walker not sink in
mobileBase (_mobileBase) {Q:<t(0. 0. .155)>, shape:ssBox, size:[.01, .01, .005, 0.0001], color:[0.,1.,0.], contact:-1, logical:{object:True, mobile}} # this is a little marker style object in the middle so the connection is in the middle --> contact-1 because here collision is okay

# graspable objects
shelf1 (base) {shape:ssBox, Q:<t(1. -2. .75)>, size:[1. .7 .5 .01], color:[1., .75, .69], contact:1, logical:{object:True, tray}}
shelf2 (base) {shape:ssBox, Q:<t(1.4 -.5 .75)>, size:[1. .7 .5 .01], color:[.79 .94 .76], contact:1, logical:{object:True, tray}} #.79 .94 .76

# this is the walkers
#Prefix: "L_"
#Include: '../robotModels/walker.g'
#Edit L_handA (base) { joint:rigid, Q:<t(-.3 1.2 .17) d(180 0 0 1)>, color:[.0 .2 .8], logical:{ gripper, support, busy, lWalker}}
#Edit L_handA (mobileBase) { joint:rigid, Q:<t(0. 0. .06) d(180 0 0 1)>, color:[.0 .2 .8], logical:{ gripper, support, busy, lWalker, onMobile}}
#Edit L_handB (L_arm2){ logical:{ gripper, lWalker}}

Prefix: "R_"
Include: '../robotModels/walker.g'
Edit R_handA (base){ joint:rigid, Q:<t(-2.3 1.3 .17) d(0 0 0 1)>, color:[.8 .2 .0], logical:{ gripper, support, busy, rWalker}}
Edit R_handB (R_arm2){ logical:{ gripper, rWalker}}
Prefix!

