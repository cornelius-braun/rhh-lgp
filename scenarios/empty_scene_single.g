base 	{  shape:ssBox, size:[8 4 0.2 0.001], contact:1,
         X:<t(0. 0. 0.1) d(0 1 0 0)>,
         logical:{ object, base } }

Prefix: "L_"
Include: '../robotModels/walker.g'
Edit L_handA (base) { joint:rigid, Q:<t(-.3 -.8 .17) d(180 0 0 1)>, color:[.8 .2 .0], logical:{ gripper, support, busy, lWalker}}
Edit L_handB (L_arm2){ color:[.8 .2 .0], logical:{ gripper, lWalker}}

Prefix!