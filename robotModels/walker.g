handA {
    X:<t(0 0 .05)>
    shape:sphere size:[.06] color:[.5 .5 .5], contact:-1,
    }

arm0(handA) {
    joint:hingeZ A:<t(0 0 .11)>
    shape:ssBox mass:1 size:[0.1 0.1 .25 .03] color:[.5 .5 .5], contact:-1 }

arm1(arm0) {
    joint:hingeX A:<t(0 0 .11)> B:<t(0 0 .11)> q:.5
    shape:ssBox mass:1 size:[0.1 0.1 .25 .03], color:[.5 .5 .5], contact:-1 }

mid1(arm1) {
    joint:hingeX A:<t(0 0 .11)> B:<t(0 0 .22)> q:.5 
    shape:ssBox mass:1 size:[0.1 0.1 .5 .03], color:[.5 .5 .5], contact:-1 }

mid2(mid1) {
    joint:hingeX A:<t(0 0 .22)> B:<t(0 0 .11)> q:.5 
    shape:ssBox mass:1 size:[0.1 0.1 .25 .03], color:[.5 .5 .5], contact:-1 }

arm2(mid2) {
    joint:hingeX A:<t(0 0 .11)> B:<t(0 0 .11)> q:.5
    shape:ssBox mass:1 size:[0.1 0.1 .25 .03], color:[.5 .5 .5], contact:-1 }

handB(arm2) {
    joint:hingeZ A:<t(0 0 .11) d(180 180 0 1)>
    shape:sphere size:[.06] color:[.5 .5 .5], contact:-1,
    }
