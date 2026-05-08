(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_type
    box - box_type
    goal - goal_type
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10 pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20 pos_21 pos_22 - position_type)

  (:init 
    (player_at pos_2) 
    (box_at box pos_14)
    (goal_at goal pos_20)
    (wall_at pos_1) (wall_at pos_3) (wall_at pos_4) (wall_at pos_5) (wall_at pos_6) 
    (wall_at pos_7) (wall_at pos_8) (wall_at pos_9) (wall_at pos_10) (wall_at pos_11) 
    (wall_at pos_12) (wall_at pos_13) (wall_at pos_15) (wall_at pos_16) (wall_at pos_18)
    (free pos_17) (free pos_19) (free pos_22)
    (adjacent pos_2 pos_14) (adjacent pos_14 pos_17) (adjacent pos_17 pos_22) (adjacent pos_14 pos_19) 
    (adjacent pos_19 pos_20) (adjacent pos_20 pos_21))

  (:goal 
    (box_at box pos_20))
)