base0 	{  shape:ssBox, size:[8 3 0.2 0.001], contact:1, X:<t(0. 2.51 0.0) d(0 1 0 0)>, logical:{ object, base } }
base1   {  shape:ssBox, size:[8 3 0.2 0.001], contact:1, X:<t(0. -1.01 0.0) d(0 1 0 0)>, logical:{ object, base } }

tray0 (base0) { shape:ssBox, size:[1,.5,1,.001], color:[.53 .9 .84], contact:1, Q:<t(0. 1. .65)>, logical:{object} } # this is where the objects are initially

_tray1 { shape:ssBox, size:[8,.5,.75,.001], color:[1. .75 .69], contact:1, X:<t(0. .75 .275)>, logical:{object,base} }
tray1 (_tray1) { shape:ssBox, size:[.5,.5,.02,.001], contact:1, Q:<t(0. 0. .38)>, logical:{object} } # actual target region on top

_tray2 (base1) { shape:ssBox, size:[1,1,1,.001], color:[.53 .81 .91], contact:1, Q:<t(0. -2. .65)>, logical:{object} }
tray2 (_tray2) { shape:ssBox, size:[1.,1.,.02,.001], contact:1, Q:<t(0. 0. .5)>, logical:{object,tray} } # actual target region on top


#### first bot
# this is the mobile base
#_plate1 (base0) { X:<t (3. 2. .17) d(-90 0 0 1)> }
#_mobileBase1 (_plate1){shape:ssBox size:[.3 .3 .3 .05] contact:1 joint:transXYPhi } # the contact makes the walker not sink in
#mobileBase1 (_mobileBase1) {Q:<t(0. 0. .155)>, shape:ssBox, size:[.01, .01, .005, 0.0001], color:[0.,1.,0.], contact:-1, logical:{object:True, mobile}} # this is a little marker style object in the middle so the connection is in the middle --> contact-1 because here collision is okay

Prefix: "L_"
Include: '../robotModels/walker.g'
Edit L_handA (base0){ joint:rigid, Q:<t(1. 0 .27) d(0 0 0 1)>, color:[.8 .2 .0], logical:{gripper, support, busy, lWalker} }
Edit L_handB (L_arm2){ logical:{ gripper, lWalker }}

#### second bot
# this is the mobile base
_plate2 (base1) { X:<t (3. -1. .25) d(-90 0 0 1)> }
_mobileBase2 (_plate2){shape:ssBox size:[.3 .3 .3 .05] contact:1 joint:transXYPhi } # the contact makes the walker not sink in
mobileBase2 (_mobileBase2) {Q:<t(0. 0. .155)>, shape:ssBox, size:[.01, .01, .005, 0.0001], color:[0.,1.,0.], contact:-1, logical:{object:True, mobile}} # this is a little marker style object in the middle so the connection is in the middle --> contact-1 because here collision is okay

#Prefix: "2_"
#Include: '../robotModels/walker.g'
#Edit 2_handA (mobileBase2){ joint:rigid, Q:<t(0 0 .06) d(0 0 0 1)>, color:[.8 .2 .0] }
#Edit 2_handB (2_arm2){ logical:{ gripper }, logical:{onMobile}}
Prefix!
