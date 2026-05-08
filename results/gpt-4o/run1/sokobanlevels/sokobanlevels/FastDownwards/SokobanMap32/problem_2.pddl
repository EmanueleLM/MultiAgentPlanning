(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    start - position
    at_box_position - position
    goal_position - position
  )
  (:init
    (at_player start)
    (at_box at_box_position)
    (is_goal goal_position)

    (is_wall position_0) (is_wall position_2) (is_wall position_3)
    (is_wall position_98) (is_wall position_99) (is_wall position_100)
    (is_wall position_102)

    (adjacent start at_box_position)
    (adjacent at_box_position goal_position)
  )
  (:goal
    (at_box goal_position)
  )
)