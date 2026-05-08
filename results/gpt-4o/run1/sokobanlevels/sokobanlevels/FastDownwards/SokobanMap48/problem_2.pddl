(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    pos_goal pos_box pos_player pos_start - position
  )

  (:init
    (at player pos_player)
    (at box pos_box)
    (goal pos_goal)
    (clear pos_start)
    
    ; define adjacencies to mimic the single corridor situation
    (adjacent pos_box pos_player) (adjacent pos_player pos_box)
    (adjacent pos_box pos_goal) (adjacent pos_goal pos_box)
  )

  (:goal
    (and
      (at box pos_goal)
      (goal pos_goal)
    )
  )
)