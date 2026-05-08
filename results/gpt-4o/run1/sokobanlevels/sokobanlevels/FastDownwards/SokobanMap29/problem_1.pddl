(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_type
    box - box_type
    goal - goal_type
    wall_1 wall_2 wall_3 wall_4 wall_5 wall_6 wall_7 wall_8 wall_9 wall_10 wall_11 wall_12 wall_13 wall_14 wall_15 - wall_type
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10 pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20 pos_21 pos_22 - position_type)

  (:init 
    (player_at pos_2) 
    (box_at box pos_14)
    (goal_at goal pos_20)
    (wall_at wall_1 pos_1) (wall_at wall_2 pos_3) (wall_at wall_3 pos_4) (wall_at wall_4 pos_5) (wall_at wall_5 pos_6) 
    (wall_at wall_6 pos_7) (wall_at wall_7 pos_8) (wall_at wall_8 pos_9) (wall_at wall_9 pos_10) (wall_at wall_10 pos_11) 
    (wall_at wall_11 pos_12) (wall_at wall_12 pos_13) (wall_at wall_13 pos_15) (wall_at wall_14 pos_16) (wall_at wall_15 pos_18)
    (adjacent pos_2 pos_14) (adjacent pos_14 pos_13) (adjacent pos_13 pos_12) (adjacent pos_12 pos_11) 
    (adjacent pos_11 pos_22) (adjacent pos_14 pos_15) (adjacent pos_15 pos_16) (adjacent pos_16 pos_17) (adjacent pos_17 pos_18)
    (adjacent pos_18 pos_19) (adjacent pos_19 pos_20) (adjacent pos_20 pos_21))

  (:goal 
    (box_at box pos_20))
)