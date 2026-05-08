(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_type
    box - box_type
    pos_start pos_box pos_goal pos_middle1 pos_middle2 pos_end - position_type)

  (:init 
    (player_at pos_start)
    (box_at box pos_box)
    (goal_at pos_goal)
    (adjacent pos_start pos_middle1)
    (adjacent pos_middle1 pos_middle2)
    (adjacent pos_middle2 pos_box)
    (adjacent pos_box pos_goal)
    (free pos_start)
    (free pos_goal)
    (free pos_middle1)
    (free pos_middle2))

  (:goal 
    (box_at box pos_goal))
)