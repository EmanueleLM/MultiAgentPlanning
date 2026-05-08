(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player_start - position
    box_start - position
    goal_pos - position
    left_pos - position
    right_pos - position
  )
  (:init
    (at_player player_start)
    (at_box box_start)
    (is_goal goal_pos)
    
    (is_wall left_pos)
    (is_wall right_pos)

    (adjacent player_start box_start)
    (adjacent box_start goal_pos)
  )
  (:goal
    (at_box goal_pos)
  )
)