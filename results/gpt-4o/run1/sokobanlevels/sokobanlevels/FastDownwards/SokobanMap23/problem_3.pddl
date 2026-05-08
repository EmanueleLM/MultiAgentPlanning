(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - object
    box - object
    ; Define the positions in a meaningful grid coordinate system
    pos_1_1 pos_2_1 pos_3_1 pos_4_1 pos_5_1 pos_6_1 pos_7_1 pos_8_1 pos_9_1 pos_10_1
    pos_11_1 pos_12_1 pos_95_1 pos_98_1
    - position)
  (:init
    (at player pos_2_1)
    (at box pos_95_1)
    (goal_at pos_98_1)
    ; Define adjacency for grid structure where walls do not exist
    (adjacent pos_2_1 pos_3_1) (adjacent pos_3_1 pos_2_1)
    (adjacent pos_3_1 pos_4_1) (adjacent pos_4_1 pos_3_1)
    (adjacent pos_4_1 pos_5_1) (adjacent pos_5_1 pos_4_1)
    (adjacent pos_5_1 pos_6_1) (adjacent pos_6_1 pos_5_1)
    ; continue with all necessary adjacencies...
    ; Specify free spaces accordingly
    (free pos_3_1) (free pos_4_1) (free pos_5_1)
    ; continue specifying all relevant free spaces...
  )
  (:goal
    (at box pos_98_1))
)