(define (problem sokoban-instance-49)
  (:domain sokoban)

  (:objects
    pos_1 - position
    pos_2 - position
    pos_48 - position
    pos_96 - position
  )

  (:init
    (player_at pos_1)
    (box_at pos_48)
    (goal_at pos_96)
    
    (adjacent pos_1 pos_2)
    (adjacent pos_2 pos_1)

    (adjacent pos_2 pos_48)
    (adjacent pos_48 pos_2)

    (adjacent pos_48 pos_96)
    (adjacent pos_96 pos_48)
  )

  (:goal
    (box_at pos_96)
  )
)