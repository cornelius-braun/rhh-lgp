#Edit worldTranslationRotation {ctrl_H=1}

Frame table1 {shape:ssBox, X=<T t( 2.2 1.25 .6)>, size=[1 1.9 .1 .02], color=[.3 .3 .3] fixed, contact, logical={} }

Frame table2 {shape:ssBox, X=<T t(2.2 -1.25 .6)>, size=[1 1.9 .1 .02], color=[.3 .3 .3] fixed, contact, logical={ table } }


Frame tray (table2) {shape:ssBox, Q=<T t(0. 0 0.07)>, size=[.15 .15 .04 .02], color=[0 1 0] fixed, contact}
Frame _ (tray) {shape:ssBox, size=[.27  .27 .04 .02], color=[0 1 0] fixed, contact}


Frame wall { shape:ssBox, X=<T t(1.9 0 0.5)>, size=[1.6 0.3 1 .02], color=[0.82 0.7 0.55] fixed, contact, logical = {wall}}
