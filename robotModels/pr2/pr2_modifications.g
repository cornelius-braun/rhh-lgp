
## SHAPES
# Edit base_link_0 { contact }
# Edit base_footprint_0 { contact }
# Edit base_bellow_link_0 { contact }
# Edit fl_caster_rotation_link_0 { contact }
# Edit fl_caster_l_wheel_link_0 { contact }
# Edit fl_caster_r_wheel_link_0 { contact }
# Edit fr_caster_rotation_link_0 { contact }
# Edit fr_caster_l_wheel_link_0 { contact }
# Edit fr_caster_r_wheel_link_0 { contact }
# Edit bl_caster_rotation_link_0 { contact }
# Edit bl_caster_l_wheel_link_0 { contact }
# Edit bl_caster_r_wheel_link_0 { contact }
# Edit br_caster_rotation_link_0 { contact }
# Edit br_caster_l_wheel_link_0 { contact }
# Edit br_caster_r_wheel_link_0 { contact }
# Edit torso_lift_link_0 { contact }
# Edit head_pan_link_0 { contact }
# Edit head_tilt_link_0 { contact }
# Edit head_plate_frame_0 { contact }
# Edit head_mount_link_0 { contact }
# Edit head_mount_kinect_ir_link_0 { contact }
# Edit head_mount_kinect_rgb_link_0 { contact }
# Edit head_mount_prosilica_link_0 { contact }
# Edit laser_tilt_mount_link_0 { contact }
# Edit r_shoulder_pan_link_0 { contact }
# Edit r_shoulder_lift_link_0 { contact }
# Edit r_upper_arm_roll_link_0 { contact }
# Edit r_upper_arm_link_0 { contact }
# Edit r_forearm_roll_link_0 { contact }
# Edit r_elbow_flex_link_0 { contact }
# Edit r_forearm_link_0 { contact }
# Edit r_wrist_flex_link_0 { contact }
# Edit r_wrist_roll_link_0 { contact }
# Edit r_gripper_palm_link_0 { contact }
# Edit r_gripper_motor_accelerometer_link_0 { contact }
# Edit r_gripper_l_finger_link_0 { contact }
# Edit r_gripper_r_finger_link_0 { contact }
# Edit r_gripper_l_finger_tip_link_0 { contact }
# Edit r_gripper_r_finger_tip_link_0 { contact }
# Edit l_shoulder_pan_link_0 { contact }
# Edit l_shoulder_lift_link_0 { contact }
# Edit l_upper_arm_roll_link_0 { contact }
# Edit l_upper_arm_link_0 { contact }
# Edit l_forearm_roll_link_0 { contact }
# Edit l_elbow_flex_link_0 { contact }
# Edit l_forearm_link_0 { contact }
# Edit l_wrist_flex_link_0 { contact }
# Edit l_wrist_roll_link_0 { contact }
# Edit l_gripper_palm_link_0 { contact }
# Edit l_gripper_motor_accelerometer_link_0 { contact }
# Edit l_gripper_l_finger_link_0 { contact }
# Edit l_gripper_r_finger_link_0 { contact }
# Edit l_gripper_l_finger_tip_link_0 { contact }
# Edit l_gripper_r_finger_tip_link_0 { contact }

## BASE
Edit worldTranslationRotation { Q:<d(90 0 0 1)> gains=[1 1] ctrl_limits=[1 1 1] ctrl_H=10 base }

## TORS0
Edit torso_lift_joint { q=.1    ctrl_H=3000  gains=[0 0] gains=[100000 10] torso }

## HEAD
Edit head_pan_joint {    ctrl_H=.1 gains=[20 2] head }
Edit head_tilt_joint {   q=.4 ctrl_H=.1 gains=[60 4] head }

## RIGHT
Edit r_shoulder_pan_joint { q=-1   gains=[220 30]  armR }
Edit r_shoulder_lift_joint { q=.5   gains=[200 20] armR }
Edit r_upper_arm_roll_joint { q=-1   gains=[100 8] armR }
Edit r_elbow_flex_joint {  q=-2  gains=[70 4] armR }
Edit r_forearm_roll_joint { q=-1.5  gains=[10 1] armR }
Edit r_wrist_flex_joint { q=-.5 gains=[30 1] armR }
Edit r_wrist_roll_joint { q=-.5  gains=[15 1] armR }

## LEFT
Edit l_shoulder_pan_joint {   q=1   gains=[220 30] armL }
Edit l_shoulder_lift_joint {  q=.5   gains=[200 20] armL }
Edit l_upper_arm_roll_joint { q=1  gains=[100 8] armL }
Edit l_elbow_flex_joint {     q=-2  gains=[70 4] armL }
Edit l_forearm_roll_joint {   q=1.5  gains=[10 1] armL }
Edit l_wrist_flex_joint {     q=-.5  gains=[30 1] armL }
Edit l_wrist_roll_joint {     q=.5  gains=[15 1] armL }

## GRIPPERS
Edit r_gripper_l_finger_joint { q=.1 gripR }
Edit l_gripper_l_finger_joint { q=.1 gripL }
Edit r_gripper_joint {  gains=[1000 1] q=.01 gripR }
Edit l_gripper_joint {  gains=[1000 1] q=.01 gripL }
Edit r_gripper_l_finger_tip_frame { mass=.05 }
Edit l_gripper_l_finger_tip_frame { mass=.05 }
#mimicking joints...
Edit r_gripper_r_finger_joint { gripR }
Edit l_gripper_r_finger_joint { gripL }
Edit r_gripper_l_finger_tip_joint { gripR }
Edit r_gripper_r_finger_tip_joint { gripR }
Edit l_gripper_l_finger_tip_joint { gripL }
Edit l_gripper_r_finger_tip_joint { gripL }

## LASER
Edit laser_tilt_mount_joint { laser }

## FT sensors
shape r_ft_sensor (r_wrist_roll_link){ rel=<T t(.01 0 0) d(-90 0 1 0) d(70.015 0 0 1)> type=4 color=[1 0 0] size=[.0 .0 .0356 .02] }
shape l_ft_sensor (l_wrist_roll_link){ rel=<T t(.01 0 0) d(-90 0 1 0) d(70.015 0 0 1)> type=4 color=[1 0 0] size=[.0 .0 .0356 .02] }
Edit r_wrist_roll_joint{ to=<T t(.0356 0 0)> }
Edit l_wrist_roll_joint{ to=<T t(.0356 0 0)> }

## extra shapes
shape base_footprint(base_footprint){ rel=<T > type=5 color=[1 0 0] size=[.5 0 0 0]}
shape endeffBase(torso_lift_link){ rel=<T d(90 0 1 0) t(.2 0 0)> type=5 color=[1 0 0] size=[.1 0 0 0]}
shape endeffHead(head_tilt_link){ rel=<T  d(-90 0 0 1) t(.08 0 .12) d(-90 0 1 0) d(-90 0 0 1)> type=5 color=[1 0 0] size=[.1 0 0 0]}
shape endeffWorkspace(torso_lift_link){ rel=<T d(90 0 1 0) t(.6 0 -.1) d(-90 0 0 1) > type=5 color=[1 0 0] size=[.1 0 0 0] }

shape endeffEyes(head_tilt_link){ rel=<T t(0 -.05 .12) d(180 0 0 1) d(-90 1 0 0)> type=5 color=[1 1 0] size=[.1 0 0 0]}
#shape endeffKinect(head_tilt_link){ rel=<T t(-0.018 0.147 0.292) d(180 0 0 1) d(-90 1 0 0) t(-0.006 0.016 0.052) t(-0.00091 0.00227 -0.0023) t(0.000267 -0.000206 0.000627)> type=5 color=[1 0 0] size=[.1 0 0 0]}
#taken from shape head_mount_kinect_rgb_link_1 (head_tilt_link){ type=sphere rel=<T 0.0125 0.147067 0.291953 -0.707107 0 0 0.707107 >  size=[ 0 0 0 0.0005 ]  }
shape endeffKinect(head_tilt_link){ rel=<T t(-0.0175 0.147067 0.291953) d(180 0 0 1) d(90 1 0 0) > type=5 color=[1 0 0] size=[.1 0 0 0]}
shape endeffLaser(laser_tilt_mount_link){ rel=<T t(-0.00300578 0.00167121 0.0122175) d(180 0 0 1) d(-90 1 0 0)> type=5 color=[1 1 1] size=[.1 0 0 0]}

#shape endeffL(l_wrist_roll_link){ rel=<T t(.2 0 0)> type=5 color=[1 0 0] size=[.05 0 0 0]}
#shape endeffR(r_wrist_roll_link){ rel=<T t(.2 0 0)> type=5 color=[1 0 0] size=[.05 0 0 0]}
shape pr2R (r_wrist_roll_link){ rel=<T d(-90 0 1 0) d(-90 0 0 1) t(0 0 -.18)> type=ssBox size=[.03 .03 .05 .01] color=[1 1 0] logical:{ gripper } }
shape pr2L (l_wrist_roll_link) { rel=<T d(-90 0 1 0) d(-90 0 0 1) t(0 0 -.18)> type=ssBox size=[.03 .03 .05 .01] color=[1 1 0] logical:{ gripper } }

#shape endeffForceL(l_wrist_roll_link){ rel=<T t(.20 0 0) d(-90 0 1 0) d(70.015 0 0 1)> type=5 color=[0 1 1] size=[.05 0 0 0]}
#shape endeffForceR(r_wrist_roll_link){ rel=<T t(.20 0 0) d(-90 0 1 0) d(70.015 0 0 1)> type=5 color=[0 1 1] size=[.05 0 0 0]}

#shape wrenchDispL(l_wrist_roll_link){ rel=<T t(.25 0 0)> type=5 color=[1 1 0] size=[.1 0 0 0]}
#shape wrenchDispR(r_wrist_roll_link){ rel=<T t(.25 0 0)> type=5 color=[1 1 0] size=[.1 0 0 0]}
