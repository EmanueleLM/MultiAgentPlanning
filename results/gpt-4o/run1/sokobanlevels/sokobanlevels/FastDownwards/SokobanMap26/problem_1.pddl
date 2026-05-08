(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - movable
    box - movable
    loc_0_0 loc_0_1 loc_0_2 loc_1_0 loc_1_1 loc_1_2 loc_2_0 loc_2_1 loc_2_2 - location
  )
  (:init
    (at player loc_0_1)
    (at box loc_1_2)
    (goal_at loc_1_1)
    (is_wall loc_0_0) (is_wall loc_0_2) (is_wall loc_1_0) (is_wall loc_2_0) (is_wall loc_2_1) (is_wall loc_2_2)
    (adjacent loc_0_1 loc_1_1) (adjacent loc_1_1 loc_0_1)
    (adjacent loc_1_1 loc_1_2) (adjacent loc_1_2 loc_1_1)
  )
  (:goal
    (at box loc_1_1)
  )
)