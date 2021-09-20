base 	{  shape:ssBox, size:[8 4 0.2 0.001], contact:1,
         X:<t(0. 0. 0.1) d(0 1 0 0)>,
         logical:{ object, base } }

Prefix: "L_"
Include: '../robotModels/walker.g'
Edit L_handA (base) { joint:rigid, Q:<t(-.3 -.8 .17) d(180 0 0 1)>, color:[.5 .81 .88], logical:{ gripper, support, busy, lWalker}}
Edit L_handB (L_arm2){ color:[.5 .81 .88], logical:{ gripper, lWalker}}

Prefix: "R_"
Include: '../robotModels/walker.g'
Edit R_handA (base){ joint:rigid, Q:<t(-.02 .6 .17) d(0 0 0 1)>, color:[.5 .81 .88], logical:{ gripper, support, busy, rWalker}}
Edit R_handB (R_arm2){ color:[.5 .81 .88], logical:{ gripper, rWalker}}
Prefix!