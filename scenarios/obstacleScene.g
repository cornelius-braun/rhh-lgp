base0 	{  shape:ssBox, size:[1.5 4 0.2 0.001], contact:1,
         X:<t(0. 0. 0.1) d(0 1 0 0)>,
         logical:{ object, base } }

Prefix: "L_"
Include: '../robotModels/walker.g'
Edit L_handA (base0){ joint:rigid, Q:<t(-.5 0. .17) d(0 0 0 1)>, color:[.0 .2 .8], logical:{gripper, support, busy, lWalker} }
Edit L_handB (L_arm2){ color:[0. .2 .8], logical:{ gripper, lWalker }}

Prefix!