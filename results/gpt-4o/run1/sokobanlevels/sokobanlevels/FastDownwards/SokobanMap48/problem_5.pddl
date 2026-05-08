(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    pos_0 pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10 - position
  )

  (:init
    (at player pos_10)
    (at box pos_5)
    (goal pos_0)
  
    (clear pos_6) (clear pos_7) (clear pos_8) (clear pos_9)
    (adjacent pos_10 pos_9) (adjacent pos_9 pos_8)
    (adjacent pos_8 pos_7) (adjacent pos_7 pos_6)
    (adjacent pos_6 pos_5) (adjacent pos_5 pos_4)
    (adjacent pos_4 pos_3) (adjacent pos_3 pos_2)
    (adjacent pos_2 pos_1) (adjacent pos_1 pos_0)
  )

  (:goal
    (at box pos_0)
  )
)