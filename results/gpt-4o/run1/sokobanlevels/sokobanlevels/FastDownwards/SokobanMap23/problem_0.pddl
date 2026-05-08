(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - object
    box - object
    pos_1_1 pos_2_1 pos_3_1 pos_4_1 pos_5_1 pos_6_1 pos_7_1 pos_8_1 pos_9_1 pos_10_1 pos_11_1 pos_12_1
    pos_1_2 pos_2_2 pos_3_2 pos_4_2 pos_5_2 pos_6_2 pos_7_2 pos_8_2 pos_9_2 pos_10_2 pos_11_2 pos_12_2
    - position)
  (:init
    (at player pos_2_2)
    (at box pos_95_2)
    (goal_at pos_98_2)
    ; Define adjacency for the specific sokoban grid (e.g., for 2D grid movement)
    (adjacent pos_2_2 pos_3_2) (adjacent pos_3_2 pos_2_2)
    (adjacent pos_3_2 pos_4_2) (adjacent pos_4_2 pos_3_2)
    ; ... Define all necessary adjacency relations for free movements
    (free pos_3_2) (free pos_4_2)
    ; ...
  )
  (:goal
    (at box pos_98_2))
)