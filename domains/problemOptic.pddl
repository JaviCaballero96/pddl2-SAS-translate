(define (problem turtlebot)
(:domain MoBAr-Rover)
(:objects
  c6_10 c16_13 c5_9 c10_2 c10_14 c1_2 c2_2 c2_3 - loc
  Leader Follower0 Follower1 - Agent
	N_0 N_1 - NavMode
	I_0 I_1 I_2 - ICam
)
(:init
	(= (distance_to_move c10_2 c10_14) 12.00000)
	(= (distance_to_move c10_14 c10_2) 12.00000)
	(= (distance_to_move c5_9 c10_14) 7.07107)
	(= (distance_to_move c10_14 c5_9) 7.07107)
	(= (distance_to_move c16_13 c10_14) 6.08276)
	(= (distance_to_move c10_14 c16_13) 6.08276)
	(= (distance_to_move c5_9 c10_2) 8.60233)
	(= (distance_to_move c10_2 c5_9) 8.60233)
	(= (distance_to_move c16_13 c10_2) 1.52996)
	(= (distance_to_move c10_2 c16_13) 1.52996)
	(= (distance_to_move c16_13 c5_9) 2.70470)
	(= (distance_to_move c5_9 c16_13) 2.70470)
	(= (distance_to_move c10_14 c6_10) 5.65685)
	(= (distance_to_move c6_10 c10_14) 5.65685)
	(= (distance_to_move c10_2 c6_10) 8.94427)
	(= (distance_to_move c6_10 c10_2) 8.94427)
	(= (distance_to_move c5_9 c6_10) 10.41421)
	(= (distance_to_move c6_10 c5_9) 10.41421)
	(= (distance_to_move c16_13 c6_10) 10.44031)
	(= (distance_to_move c6_10 c16_13) 10.44031)
	(= (distance_to_move c1_2 c6_10) 5.44031)
	(= (distance_to_move c6_10 c1_2) 5.44031)
	(= (distance_to_move c1_2 c16_13) 8.44031)
	(= (distance_to_move c16_13 c1_2) 8.44031)
	(= (distance_to_move c1_2 c5_9) 5.44031)
	(= (distance_to_move c5_9 c1_2) 5.44031)
	(= (distance_to_move c1_2 c10_2) 5.44031)
	(= (distance_to_move c10_2 c1_2) 5.44031)
	(= (distance_to_move c1_2 c10_14) 6.44031)
	(= (distance_to_move c10_14 c1_2) 6.44031)
	(= (distance_to_move c2_2 c6_10) 3.44031)
	(= (distance_to_move c6_10 c2_2) 3.44031)
	(= (distance_to_move c2_2 c16_13) 4.44031)
	(= (distance_to_move c16_13 c2_2) 4.44031)
	(= (distance_to_move c2_2 c5_9) 1.44031)
	(= (distance_to_move c5_9 c2_2) 1.44031)
	(= (distance_to_move c2_2 c10_2) 3.44031)
	(= (distance_to_move c10_2 c2_2) 3.44031)
	(= (distance_to_move c2_2 c10_14) 4.44031)
	(= (distance_to_move c10_14 c1_2) 4.44031)
	(= (distance_to_move c2_2 c1_2) 5.44031)
	(= (distance_to_move c1_2 c2_2) 5.44031)
	(= (distance_to_move c2_3 c6_10) 3.44031)
	(= (distance_to_move c6_10 c2_3) 3.44031)
	(= (distance_to_move c2_3 c16_13) 4.44031)
	(= (distance_to_move c16_13 c2_3) 4.44031)
	(= (distance_to_move c2_3 c5_9) 1.44031)
	(= (distance_to_move c5_9 c2_3) 1.44031)
	(= (distance_to_move c2_3 c10_2) 3.44031)
	(= (distance_to_move c10_2 c2_3) 3.44031)
	(= (distance_to_move c2_3 c10_14) 4.44031)
	(= (distance_to_move c10_14 c2_3) 4.44031)
	(= (distance_to_move c2_2 c2_3) 5.44031)
	(= (distance_to_move c2_3 c2_2) 5.44031)
	(= (distance_to_move c2_2 c2_3) 5.44031)
	(= (distance_to_move c2_3 c2_2) 5.44031)
(dockPos c10_2)
(dockPos c5_9)
(dockPos c6_10)
(free LEADER)
(free FOLLOWER0)
(free FOLLOWER1)
(RobotBase_At LEADER c10_2)
(RobotBase_At FOLLOWER0 c5_9)
(RobotBase_At FOLLOWER0 c2_2)
(RobotBase_OnDock LEADER)
(RobotBase_OnDock FOLLOWER0)
(RobotBase_OnDock FOLLOWER1)
(inside I_0 LEADER)
(inside I_1 FOLLOWER0)
(inside I_2 FOLLOWER1)
(Navigation_Mode LEADER N_1)
(Navigation_Mode FOLLOWER0 N_1)
(Navigation_Mode FOLLOWER1 N_1)
(modeTransition N_0 N_1)
(modeTransition N_1 N_0)
(= (total_dist) 0)
(= (dist LEADER) 0)
(= (dist FOLLOWER0) 0)
(= (dist FOLLOWER1) 0)
(= (risk LEADER) 0)
(= (risk FOLLOWER0) 0)
(= (risk FOLLOWER1) 0)
(= (battery LEADER) 0)
(= (battery FOLLOWER0) 0)
(= (battery FOLLOWER1) 0)
(= (speed LEADER N_0) 0.1)
(= (speed LEADER N_1) 0.2)
(= (speed FOLLOWER0 N_0) 0.1)
(= (speed FOLLOWER0 N_1) 0.2)
(= (speed FOLLOWER1 N_0) 0.1)
(= (speed FOLLOWER1 N_1) 0.2)
(= (posRisk c6_10) 0.1)
(= (posRisk c1_2) 0.1)
(= (posRisk c16_13) 0.2)
(= (posRisk c5_9) 0.3)
(= (posRisk c10_2) 0.4)
(= (posRisk c10_14) 0.5)
(= (batperdis LEADER N_0) 0.1)
(= (batperdis LEADER N_1) 0.2)
(= (batperdis FOLLOWER0 N_0) 0.1)
(= (batperdis FOLLOWER0 N_1) 0.2)
(= (batperdis FOLLOWER1 N_0) 0.1)
(= (batperdis FOLLOWER1 N_1) 0.2)
(= (photoEnergy) 0.2)
(= (timePhoto) 0.1)
(= (energyTransPhoto) 0.1)
(= (timeTransPhoto) 0.1)
(= (total_time) 0)
(= (metricPercentage FOLLOWER0)	30)
(= (metricPercentage LEADER) 20)
)
(:goal (and
 (Communication_transmittedP c10_14)
 (Communication_transmittedP c1_2)
 (Communication_transmittedP c16_13)
 (Communication_transmittedP c2_2)
  (Communication_transmittedP c2_3)
 (RobotBase_OnDock LEADER)
 (RobotBase_OnDock FOLLOWER0)
 (RobotBase_OnDock FOLLOWER1)
 )
)
(:metric minimize (+ (battery FOLLOWER0) (battery FOLLOWER1) (battery LEADER) (risk LEADER)))
)
