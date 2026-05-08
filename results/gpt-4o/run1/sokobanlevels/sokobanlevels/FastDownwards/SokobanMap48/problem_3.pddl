(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    pos_goal pos_box pos_player pos_intermediate - position
  )

  (:init
    (at player pos_player)
    (at box pos_box)
    (goal pos_goal)
    (clear pos_intermediate)
    
    ; define adjacencies
    (adjacent pos_box pos_intermediate) (adjacent pos_intermediate pos_box)
    (adjacent pos_intermediate pos_goal) (adjacent pos_goal pos_intermediate)
    (adjacent pos_player pos_box) (adjacent pos_box pos_player)
  )

  (:goal
    (and
      (at box pos_goal)
    )
  )
)