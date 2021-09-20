body world {  }
body base_footprint { mass=140.967  }
body torso_lift_link { pose=<T -0.05 0 0.790675 0.707107 0 -0.707107 0 > mass=36.449  }
body head_pan_link { pose=<T -0.06707 0 1.17213 -0.707107 -0 0.707107 -0 > mass=6.339  }
body laser_tilt_mount_link { pose=<T 0.04893 0 1.01768 -0.707107 0 0 -0.707107 > mass=0.592  }
body r_shoulder_pan_link { pose=<T -0.05 -0.188 0.790675 -0.707107 -0 0.707107 -0 > mass=25.7993  }
body l_shoulder_pan_link { pose=<T -0.05 0.188 0.790675 -0.707107 -0 0.707107 -0 > mass=25.7993  }
body head_tilt_link { pose=<T 0.00093 0 1.17213 0.707107 0 0 0.707107 > mass=5.441  }
body r_shoulder_lift_link { pose=<T 0.05 -0.188 0.790675 0.707107 0 0 0.707107 > mass=2.74988  }
body l_shoulder_lift_link { pose=<T 0.05 0.188 0.790675 0.707107 0 0 0.707107 > mass=2.74988  }
body r_upper_arm_roll_link { pose=<T 0.05 -0.188 0.790675 -1 0 -0 0 > mass=6.11769  }
body l_upper_arm_roll_link { pose=<T 0.05 0.188 0.790675 -1 0 -0 0 > mass=6.11769  }
body r_elbow_flex_link { pose=<T 0.45 -0.188 0.790675 -0.707107 0 -0 -0.707107 > mass=1.90327  }
body l_elbow_flex_link { pose=<T 0.45 0.188 0.790675 -0.707107 0 -0 -0.707107 > mass=1.90327  }
body r_forearm_roll_link { pose=<T 0.45 -0.188 0.790675 1 -0 0 0 > mass=2.68968  }
body l_forearm_roll_link { pose=<T 0.45 0.188 0.790675 1 -0 0 0 > mass=2.68968  }
body r_wrist_flex_link { pose=<T 0.771 -0.188 0.790675 0.707107 0 0 0.707107 > mass=0.61402  }
body l_wrist_flex_link { pose=<T 0.771 0.188 0.790675 0.707107 0 0 0.707107 > mass=0.61402  }
body r_wrist_roll_link { pose=<T 0.771 -0.188 0.790675 -1 0 -0 0 > mass=0.681071  }
body l_wrist_roll_link { pose=<T 0.771 0.188 0.790675 -1 0 -0 0 > mass=0.681071  }
body r_gripper_l_finger_link { pose=<T 0.84791 -0.178 0.790675 -0.707107 0 0.707107 0 > mass=0.17126  }
body r_gripper_r_finger_link { pose=<T 0.84791 -0.198 0.790675 -0.707107 0 -0.707107 0 > mass=0.17389  }
body l_gripper_l_finger_link { pose=<T 0.84791 0.198 0.790675 -0.707107 0 0.707107 0 > mass=0.17126  }
body l_gripper_r_finger_link { pose=<T 0.84791 0.178 0.790675 -0.707107 0 -0.707107 0 > mass=0.17389  }
body r_gripper_l_finger_tip_link { pose=<T 0.93928 -0.17305 0.790675 0.707107 0 0.707107 -0 > mass=0.04419  }
body r_gripper_r_finger_tip_link { pose=<T 0.93928 -0.20295 0.790675 0.707107 -0 -0.707107 0 > mass=0.04419  }
body l_gripper_l_finger_tip_link { pose=<T 0.93928 0.20295 0.790675 0.707107 0 0.707107 -0 > mass=0.04419  }
body l_gripper_r_finger_tip_link { pose=<T 0.93928 0.17305 0.790675 0.707107 -0 -0.707107 0 > mass=0.04419  }
body r_gripper_l_finger_tip_frame { pose=<T 0.93928 -0.20295 0.790675 -0.707107 0 0 -0.707107 >  }
body l_gripper_l_finger_tip_frame { pose=<T 0.93928 0.17305 0.790675 -0.707107 0 0 -0.707107 >  }

shape base_link_1 (base_footprint){ type=mesh rel=<T -0.0282159 0.00517696 0.272424 1 0 0 0 >  mesh='base_v0/base.stl'  meshscale=0.1  rel_includes_mesh_center,  }
shape base_footprint_1 (base_footprint){ type=box  size=[ 0.01 0.01 0.01 0 ]  }
shape base_bellow_link_1 (base_footprint){ type=box rel=<T -0.29 0 0.851 1 0 0 0 >  size=[ 0.05 0.37 0.3 0 ]  }
shape fl_caster_rotation_link_1 (base_footprint){ type=mesh rel=<T 0.21838 0.225407 0.180919 1 0 0 0 >  mesh='base_v0/caster.stl'  rel_includes_mesh_center,  }
shape fl_caster_l_wheel_link_1 (base_footprint){ type=mesh rel=<T 0.224225 0.270791 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape fl_caster_r_wheel_link_1 (base_footprint){ type=mesh rel=<T 0.224225 0.172791 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape fr_caster_rotation_link_1 (base_footprint){ type=mesh rel=<T 0.21838 -0.223793 0.180919 1 0 0 0 >  mesh='base_v0/caster.stl'  rel_includes_mesh_center,  }
shape fr_caster_l_wheel_link_1 (base_footprint){ type=mesh rel=<T 0.224225 -0.178409 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape fr_caster_r_wheel_link_1 (base_footprint){ type=mesh rel=<T 0.224225 -0.276409 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape bl_caster_rotation_link_1 (base_footprint){ type=mesh rel=<T -0.23082 0.225407 0.180919 1 0 0 0 >  mesh='base_v0/caster.stl'  rel_includes_mesh_center,  }
shape bl_caster_l_wheel_link_1 (base_footprint){ type=mesh rel=<T -0.224975 0.270791 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape bl_caster_r_wheel_link_1 (base_footprint){ type=mesh rel=<T -0.224975 0.172791 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape br_caster_rotation_link_1 (base_footprint){ type=mesh rel=<T -0.23082 -0.223793 0.180919 1 0 0 0 >  mesh='base_v0/caster.stl'  rel_includes_mesh_center,  }
shape br_caster_l_wheel_link_1 (base_footprint){ type=mesh rel=<T -0.224975 -0.178409 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape br_caster_r_wheel_link_1 (base_footprint){ type=mesh rel=<T -0.224975 -0.276409 0.0789213 1 0 0 0 >  mesh='base_v0/wheel.stl'  rel_includes_mesh_center,  }
shape torso_lift_link_1 (torso_lift_link){ type=mesh rel=<T 0.120676 -0.00108579 0.0665629 -0.707107 0 -0.707107 0 >  mesh='torso_v0/torso_lift.stl'  rel_includes_mesh_center,  }
shape head_pan_link_1 (head_pan_link){ type=mesh rel=<T -0.00764864 0.000777182 -0.0404273 -0.707107 0 -0.707107 0 >  mesh='head_v0/head_pan.stl'  rel_includes_mesh_center,  }
shape head_tilt_link_1 (head_tilt_link){ type=mesh rel=<T 0.000961809 -0.00114119 0.0964492 -0.707107 0 0 0.707107 >  mesh='head_v0/head_tilt.stl'  rel_includes_mesh_center,  }
shape head_plate_frame_1 (head_tilt_link){ type=box rel=<T 5.15143e-18 -0.0232 0.0645 -0.707107 0 0 0.707107 >  size=[ 0.01 0.01 0.01 0 ]  }
shape sensor_mount_link_1 (head_tilt_link){ type=box rel=<T 5.15143e-18 -0.0232 0.0645 -0.707107 0 0 0.707107 >  size=[ 0.01 0.01 0.01 0 ]  }
shape double_stereo_link_1 (head_tilt_link){ type=box rel=<T 2.93099e-18 -0.0132 0.0895 -0.707107 0 0 0.707107 >  size=[ 0.02 0.12 0.05 0 ]  }
shape head_mount_link_1 (head_tilt_link){ type=mesh rel=<T 0.00394516 0.168922 0.258886 -0.707107 0 0 0.707107 >  mesh='sensors/kinect_prosilica_v0/115x100_swept_back--coarse.stl'  color=[ 0.5 0.5 0.5 1 ]  meshscale=0.001  rel_includes_mesh_center,  }
shape head_mount_kinect_ir_link_1 (head_tilt_link){ type=sphere rel=<T 0.0125 0.147067 0.291953 -0.707107 0 0 0.707107 >  size=[ 0 0 0 0.0005 ]  }
shape head_mount_kinect_rgb_link_1 (head_tilt_link){ type=sphere rel=<T -0.0175 0.147067 0.291953 -0.707107 0 0 0.707107 >  size=[ 0 0 0 0.0005 ]  }
shape head_mount_prosilica_link_1 (head_tilt_link){ type=sphere rel=<T 0.0125 0.161257 0.244421 -0.707107 0 0 0.707107 >  size=[ 0 0 0 0.0005 ]  }
shape laser_tilt_mount_link_1 (laser_tilt_mount_link){ type=mesh rel=<T -0.00300578 0.00167121 0.0122175 -0.707107 0 0 0.707107 >  mesh='tilting_laser_v0/tilting_hokuyo.stl'  rel_includes_mesh_center,  }
shape r_shoulder_pan_link_1 (r_shoulder_pan_link){ type=mesh rel=<T -0.16813 0.00258043 -0.00550141 -0.707107 0 -0.707107 0 >  mesh='shoulder_v0/shoulder_pan.stl'  rel_includes_mesh_center,  }
shape r_shoulder_lift_link_1 (r_shoulder_lift_link){ type=mesh rel=<T -0.00127619 -0.0563251 0.0161388 -0.707107 0 0 0.707107 >  mesh='shoulder_v0/shoulder_lift.stl'  rel_includes_mesh_center,  }
shape r_upper_arm_roll_link_1 (r_upper_arm_roll_link){ type=mesh rel=<T 0.121137 9.59109e-05 5.64062e-05 -1 0 0 0 >  mesh='shoulder_v0/upper_arm_roll.stl'  rel_includes_mesh_center,  }
shape r_upper_arm_link_1 (r_upper_arm_roll_link){ type=mesh rel=<T 0.303332 -0.00060982 -0.0039943 -1 0 0 0 >  mesh='upper_arm_v0/upper_arm.stl'  rel_includes_mesh_center,  }
shape r_forearm_roll_link_1 (r_forearm_roll_link){ type=mesh rel=<T 0.086794 -0.000500601 0.00973495 -1 0 0 0 >  mesh='upper_arm_v0/forearm_roll.stl'  rel_includes_mesh_center,  }
shape r_elbow_flex_link_1 (r_elbow_flex_link){ type=mesh rel=<T -0.00060554 -0.0250394 -0.00341596 -0.707107 0 0 0.707107 >  mesh='upper_arm_v0/elbow_flex.stl'  rel_includes_mesh_center,  }
shape r_forearm_link_1 (r_forearm_roll_link){ type=mesh rel=<T 0.216445 0.000691519 0.00300974 -1 0 0 0 >  mesh='forearm_v0/forearm.stl'  rel_includes_mesh_center,  }
shape r_wrist_flex_link_1 (r_wrist_flex_link){ type=mesh rel=<T -0.000233081 0.00258595 -0.00218093 -0.707107 0 0 0.707107 >  mesh='forearm_v0/wrist_flex.stl'  rel_includes_mesh_center,  }
shape r_wrist_roll_link_1 (r_wrist_roll_link){ type=mesh rel=<T 0.0317264 0.000290217 -0.00107323 -1 0 0 0 >  mesh='forearm_v0/wrist_roll.stl'  rel_includes_mesh_center,  }
shape r_gripper_palm_link_1 (r_wrist_roll_link){ type=mesh rel=<T 0.0883957 0.000221324 -2.62985e-05 -1 0 0 0 >  mesh='gripper_v0/gripper_palm.stl'  rel_includes_mesh_center,  }
shape r_gripper_motor_accelerometer_link_1 (r_wrist_roll_link){ type=box  size=[ 0.001 0.001 0.001 0 ]  }
shape r_gripper_l_finger_link_1 (r_gripper_l_finger_link){ type=mesh rel=<T -0.000214812 0.0125558 -0.0493868 -0.707107 0 -0.707107 0 >  mesh='gripper_v0/l_finger.stl'  rel_includes_mesh_center,  }
shape r_gripper_r_finger_link_1 (r_gripper_r_finger_link){ type=mesh rel=<T -0.000214812 -0.0125558 0.0493868 7.3123e-14 -0.707107 -7.3123e-14 -0.707107 >  mesh='gripper_v0/l_finger.stl'  rel_includes_mesh_center,  }
shape r_gripper_l_finger_tip_link_1 (r_gripper_l_finger_tip_link){ type=mesh rel=<T 0.000126401 0.000750209 0.0081309 -0.707107 -0 0.707107 0 >  mesh='gripper_v0/l_finger_tip.stl'  rel_includes_mesh_center,  }
shape r_gripper_r_finger_tip_link_1 (r_gripper_r_finger_tip_link){ type=mesh rel=<T 0.000126401 -0.000750209 -0.0081309 7.3123e-14 -0.707107 7.3123e-14 0.707107 >  mesh='gripper_v0/l_finger_tip.stl'  rel_includes_mesh_center,  }
shape l_shoulder_pan_link_1 (l_shoulder_pan_link){ type=mesh rel=<T -0.16813 0.00258043 -0.00550141 -0.707107 0 -0.707107 0 >  mesh='shoulder_v0/shoulder_pan.stl'  rel_includes_mesh_center,  }
shape l_shoulder_lift_link_1 (l_shoulder_lift_link){ type=mesh rel=<T -0.00127619 -0.0563251 0.0161388 -0.707107 0 0 0.707107 >  mesh='shoulder_v0/shoulder_lift.stl'  rel_includes_mesh_center,  }
shape l_upper_arm_roll_link_1 (l_upper_arm_roll_link){ type=mesh rel=<T 0.121137 9.59109e-05 5.64062e-05 -1 0 0 0 >  mesh='shoulder_v0/upper_arm_roll.stl'  rel_includes_mesh_center,  }
shape l_upper_arm_link_1 (l_upper_arm_roll_link){ type=mesh rel=<T 0.303332 -0.00060982 -0.0039943 -1 0 0 0 >  mesh='upper_arm_v0/upper_arm.stl'  rel_includes_mesh_center,  }
shape l_forearm_roll_link_1 (l_forearm_roll_link){ type=mesh rel=<T 0.086794 -0.000500601 0.00973495 -1 0 0 0 >  mesh='upper_arm_v0/forearm_roll.stl'  rel_includes_mesh_center,  }
shape l_elbow_flex_link_1 (l_elbow_flex_link){ type=mesh rel=<T -0.00060554 -0.0250394 -0.00341596 -0.707107 0 0 0.707107 >  mesh='upper_arm_v0/elbow_flex.stl'  rel_includes_mesh_center,  }
shape l_forearm_link_1 (l_forearm_roll_link){ type=mesh rel=<T 0.216445 0.000691519 0.00300974 -1 0 0 0 >  mesh='forearm_v0/forearm.stl'  rel_includes_mesh_center,  }
shape l_wrist_flex_link_1 (l_wrist_flex_link){ type=mesh rel=<T -0.000233081 0.00258595 -0.00218093 -0.707107 0 0 0.707107 >  mesh='forearm_v0/wrist_flex.stl'  rel_includes_mesh_center,  }
shape l_wrist_roll_link_1 (l_wrist_roll_link){ type=mesh rel=<T 0.0317264 0.000290217 -0.00107323 -1 0 0 0 >  mesh='forearm_v0/wrist_roll.stl'  rel_includes_mesh_center,  }
shape l_gripper_palm_link_1 (l_wrist_roll_link){ type=mesh rel=<T 0.0883957 0.000221324 -2.62985e-05 -1 0 0 0 >  mesh='gripper_v0/gripper_palm.stl'  rel_includes_mesh_center,  }
shape l_gripper_motor_accelerometer_link_1 (l_wrist_roll_link){ type=box  size=[ 0.001 0.001 0.001 0 ]  }
shape l_gripper_l_finger_link_1 (l_gripper_l_finger_link){ type=mesh rel=<T -0.000214812 0.0125558 -0.0493868 -0.707107 0 -0.707107 0 >  mesh='gripper_v0/l_finger.stl'  rel_includes_mesh_center,  }
shape l_gripper_r_finger_link_1 (l_gripper_r_finger_link){ type=mesh rel=<T -0.000214812 -0.0125558 0.0493868 7.3123e-14 -0.707107 -7.3123e-14 -0.707107 >  mesh='gripper_v0/l_finger.stl'  rel_includes_mesh_center,  }
shape l_gripper_l_finger_tip_link_1 (l_gripper_l_finger_tip_link){ type=mesh rel=<T 0.000126401 0.000750209 0.0081309 -0.707107 -0 0.707107 0 >  mesh='gripper_v0/l_finger_tip.stl'  rel_includes_mesh_center,  }
shape l_gripper_r_finger_tip_link_1 (l_gripper_r_finger_tip_link){ type=mesh rel=<T 0.000126401 -0.000750209 -0.0081309 7.3123e-14 -0.707107 7.3123e-14 0.707107 >  mesh='gripper_v0/l_finger_tip.stl'  rel_includes_mesh_center,  }
shape coll_base (base_footprint){ type=ssBox rel=<T 0 0 0.18 1 0 0 0 >  size=[ 0.7 0.7 0.36 0.1 ]  contact=-2, coll_pr2,  color:[1.,1.,1.,.2]  }
shape coll_torso (base_footprint){ type=ssBox rel=<T -0.13 0 0.55 1 0 0 0 >  size=[ 0.45 0.7 1.1 0.1 ]  contact=-2, coll_pr2,  color:[1.,1.,1.,.2]  }
shape coll_arm_r (r_upper_arm_roll_link){ type=ssBox rel=<T 0.221337 0 0 -1 0 0 0 >  size=[ 0.55 0.2 0.2 0.1 ]  contact=-4, coll_pr2,  color:[1.,1.,1.,.2]  }
shape coll_wrist_r (r_forearm_roll_link){ type=ssBox rel=<T 0.21 0 0 0.999391 0 0.0348995 0 >  size=[ 0.35 0.14 0.14 0.07 ]  contact=-2, coll_pr2,  color:[1.,1.,1.,.2]  }
shape coll_hand_r (r_wrist_roll_link){ type=ssBox rel=<T 0.12 0 0 -1 0 0 0 >  size=[ 0.16 0.12 0.06 0.025 ]  contact=-2, coll_pr2,  color:[1.,1.,1.,.2]  }
shape coll_arm_l (l_upper_arm_roll_link){ type=ssBox rel=<T 0.221337 0 0 -1 0 0 0 >  size=[ 0.55 0.2 0.2 0.1 ]  contact=-4, coll_pr2,  color:[1.,1.,1.,.2]  }
shape coll_wrist_l (l_forearm_roll_link){ type=ssBox rel=<T 0.21 0 0 0.999391 0 0.0348995 0 >  size=[ 0.35 0.14 0.14 0.07 ]  contact=-2, coll_pr2,  color:[1.,1.,1.,.2]  }
shape coll_hand_l (l_wrist_roll_link){ type=ssBox rel=<T 0.12 0 0 -1 0 0 0 >  size=[ 0.16 0.12 0.06 0.025 ]  contact=-2, coll_pr2,  color:[1.,1.,1.,.2]  }
shape l_gripper_frame (l_gripper_l_finger_tip_frame){ type=marker rel=<T -0 -0 -0 -0.707107 0 0 0.707107 >  size=[ 0.1 0 0 0 ]  }
shape r_gripper_frame (r_gripper_l_finger_tip_frame){ type=marker rel=<T -0 -0 -0 -0.707107 0 0 0.707107 >  size=[ 0.1 0 0 0 ]  }

joint worldTranslationRotation (world base_footprint){ type=transXYPhi  ctrl_H=20  }
joint torso_lift_joint (base_footprint torso_lift_link){ type=transX from=<T -0.05 0 0.790675 0.707107 0 -0.707107 0 >  limits=[ 0.0115 0.325 ]  limits=[ 0 0.33 ]  ctrl_limits=[ 0.013 10000 1 ]  }
joint head_pan_joint (torso_lift_link head_pan_link){ type=hingeX from=<T 0.38145 0 0.01707 -1 0 0 0 >  limits=[ -2.857 2.857 ]  limits=[ -3.007 3.007 ]  ctrl_limits=[ 6 2.645 0.5 ]  }
joint laser_tilt_mount_joint (torso_lift_link laser_tilt_mount_link){ type=hingeX from=<T 0.227 0 -0.09893 -0.5 -0.5 -0.5 -0.5 >  limits=[ -0.7354 1.43353 ]  limits=[ -0.7854 1.48353 ]  ctrl_limits=[ 10 0.65 1 ]  }
joint r_shoulder_pan_joint (torso_lift_link r_shoulder_pan_link){ type=hingeX from=<T -0 -0.188 0 -1 0 0 0 >  limits=[ -2.1354 0.564602 ]  limits=[ -2.2854 0.714602 ]  ctrl_limits=[ 2.088 30 4 ]  }
joint l_shoulder_pan_joint (torso_lift_link l_shoulder_pan_link){ type=hingeX from=<T 0 0.188 -0 -1 0 0 0 >  limits=[ -0.564602 2.1354 ]  limits=[ -0.714602 2.2854 ]  ctrl_limits=[ 2.088 30 4 ]  }
joint head_tilt_joint (head_pan_link head_tilt_link){ type=hingeX from=<T 1.5099e-17 -0 -0.068 -0.5 -0.5 -0.5 -0.5 >  limits=[ -0.3712 1.29626 ]  limits=[ -0.471238 1.39626 ]  ctrl_limits=[ 5 18 0.1 ]  }
joint r_shoulder_lift_joint (r_shoulder_pan_link r_shoulder_lift_link){ type=hingeX from=<T 2.22045e-17 -0 -0.1 -0.5 -0.5 -0.5 -0.5 >  limits=[ -0.3536 1.2963 ]  limits=[ -0.5236 1.3963 ]  ctrl_limits=[ 2.082 30 4 ]  }
joint l_shoulder_lift_joint (l_shoulder_pan_link l_shoulder_lift_link){ type=hingeX from=<T 2.22045e-17 -0 -0.1 -0.5 -0.5 -0.5 -0.5 >  limits=[ -0.3536 1.2963 ]  limits=[ -0.5236 1.3963 ]  ctrl_limits=[ 2.082 30 4 ]  }
joint r_upper_arm_roll_joint (r_shoulder_lift_link r_upper_arm_roll_link){ type=hingeX from=<T -0 -0 -0 -0.707107 0 0 0.707107 >  limits=[ -3.75 0.65 ]  limits=[ -3.9 0.8 ]  ctrl_limits=[ 3.27 30 4 ]  }
joint l_upper_arm_roll_joint (l_shoulder_lift_link l_upper_arm_roll_link){ type=hingeX from=<T -0 -0 -0 -0.707107 0 0 0.707107 >  limits=[ -0.65 3.75 ]  limits=[ -0.8 3.9 ]  ctrl_limits=[ 3.27 30 4 ]  }
joint r_elbow_flex_joint (r_upper_arm_roll_link r_elbow_flex_link){ type=hingeX from=<T 0.4 0 0 0.707107 0 0 0.707107 >  limits=[ -2.1213 -0.15 ]  limits=[ -2.3213 0 ]  ctrl_limits=[ 3.3 30 4 ]  }
joint l_elbow_flex_joint (l_upper_arm_roll_link l_elbow_flex_link){ type=hingeX from=<T 0.4 0 0 0.707107 0 0 0.707107 >  limits=[ -2.1213 -0.15 ]  limits=[ -2.3213 0 ]  ctrl_limits=[ 3.3 30 4 ]  }
joint r_forearm_roll_joint (r_elbow_flex_link r_forearm_roll_link){ type=hingeX from=<T -0 -0 -0 -0.707107 0 0 0.707107 >  ctrl_limits=[ 3.6 30 2 ]  }
joint l_forearm_roll_joint (l_elbow_flex_link l_forearm_roll_link){ type=hingeX from=<T -0 -0 -0 -0.707107 0 0 0.707107 >  ctrl_limits=[ 3.6 30 2 ]  }
joint r_wrist_flex_joint (r_forearm_roll_link r_wrist_flex_link){ type=hingeX from=<T 0.321 0 0 0.707107 0 0 0.707107 >  limits=[ -2 -0.1 ]  limits=[ -2.18 0 ]  ctrl_limits=[ 3.078 10 2 ]  }
joint l_wrist_flex_joint (l_forearm_roll_link l_wrist_flex_link){ type=hingeX from=<T 0.321 0 0 0.707107 0 0 0.707107 >  limits=[ -2 -0.1 ]  limits=[ -2.18 0 ]  ctrl_limits=[ 3.078 10 2 ]  }
joint r_wrist_roll_joint (r_wrist_flex_link r_wrist_roll_link){ type=hingeX from=<T -0 -0 -0 -0.707107 0 0 0.707107 >  ctrl_limits=[ 3.6 10 2 ]  }
joint l_wrist_roll_joint (l_wrist_flex_link l_wrist_roll_link){ type=hingeX from=<T -0 -0 -0 -0.707107 0 0 0.707107 >  ctrl_limits=[ 3.6 10 2 ]  }
joint r_gripper_l_finger_joint (r_wrist_roll_link r_gripper_l_finger_link){ type=hingeX from=<T 0.07691 0.01 0 0.707107 0 -0.707107 0 >  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint r_gripper_r_finger_joint (r_wrist_roll_link r_gripper_r_finger_link){ type=hingeX from=<T 0.07691 -0.01 0 0.707107 -0 0.707107 0 >  mimic="r_gripper_l_finger_joint"  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint l_gripper_l_finger_joint (l_wrist_roll_link l_gripper_l_finger_link){ type=hingeX from=<T 0.07691 0.01 0 0.707107 0 -0.707107 0 >  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint l_gripper_r_finger_joint (l_wrist_roll_link l_gripper_r_finger_link){ type=hingeX from=<T 0.07691 -0.01 0 0.707107 -0 0.707107 0 >  mimic="l_gripper_l_finger_joint"  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint r_gripper_l_finger_tip_joint (r_gripper_l_finger_link r_gripper_l_finger_tip_link){ type=hingeX from=<T 2.02882e-17 0.00495 -0.09137 -2.22045e-16 0 -1 0 >  mimic="r_gripper_l_finger_joint"  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint r_gripper_r_finger_tip_joint (r_gripper_r_finger_link r_gripper_r_finger_tip_link){ type=hingeX from=<T 2.02882e-17 -0.00495 0.09137 -2.22045e-16 0 1 0 >  mimic="r_gripper_l_finger_joint"  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint l_gripper_l_finger_tip_joint (l_gripper_l_finger_link l_gripper_l_finger_tip_link){ type=hingeX from=<T 2.02882e-17 0.00495 -0.09137 -2.22045e-16 0 -1 0 >  mimic="l_gripper_l_finger_joint"  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint l_gripper_r_finger_tip_joint (l_gripper_r_finger_link l_gripper_r_finger_tip_link){ type=hingeX from=<T 2.02882e-17 -0.00495 0.09137 -2.22045e-16 0 1 0 >  mimic="l_gripper_l_finger_joint"  limits=[ 0 0.548 ]  ctrl_limits=[ 0.5 1000 1 ]  }
joint r_gripper_joint (r_gripper_r_finger_tip_link r_gripper_l_finger_tip_frame){ type=transX from=<T -0 -0 -0 -0.5 -0.5 -0.5 -0.5 >  limits=[ -0.01 0.088 ]  limits=[ 0 0.09 ]  ctrl_limits=[ 0.2 1000 1 ]  }
joint l_gripper_joint (l_gripper_r_finger_tip_link l_gripper_l_finger_tip_frame){ type=transX from=<T -0 -0 -0 -0.5 -0.5 -0.5 -0.5 >  limits=[ -0.01 0.088 ]  limits=[ 0 0.09 ]  ctrl_limits=[ 0.2 1000 1 ]  }
