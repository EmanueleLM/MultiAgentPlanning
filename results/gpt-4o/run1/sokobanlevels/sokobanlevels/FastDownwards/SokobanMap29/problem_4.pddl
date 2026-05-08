(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_type
    box - box_type
    goal - goal_type
    pos_start pos_box pos_goal pos_between pos_end - position_type)

  (:init 
    (player_at pos_start)
    (box_at box pos_box)
    (goal_at goal pos_goal)
    (adjacent pos_start pos_box)
    (adjacent pos_box pos_between)
    (adjacent pos_between pos_goal)
    (adjacent pos_start pos_between)
    (free pos_goal)
    (free pos_start))

  (:goal 
    (box_at box pos_goal))
)