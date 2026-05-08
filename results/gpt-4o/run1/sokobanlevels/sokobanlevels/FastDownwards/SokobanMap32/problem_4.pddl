(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    pos_1 pos_2 pos_3 wall_1 wall_2 - position
  )
  (:init
    (at_player pos_3)
    (at_box pos_2)
    (is_goal pos_1)
    
    (is_wall wall_1)
    (is_wall wall_2)

    (adjacent pos_3 pos_2)
    (adjacent pos_2 pos_1)
    (adjacent pos_1 pos_2) ; Ensure mutual adjacency
    (adjacent pos_2 pos_3) ; Ensure mutual adjacency
  )
  (:goal
    (at_box pos_1)
  )
)