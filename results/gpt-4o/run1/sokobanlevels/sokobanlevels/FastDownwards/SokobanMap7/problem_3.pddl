(define (problem sokoban_instance)
  (:domain sokoban)
  (:objects
    player - agent
    box - box
    pos_0_0 pos_0_1 pos_0_2 pos_1_0 pos_1_1 pos_1_2 pos_2_0 pos_2_1 pos_2_2 - position
  )
  (:init
    (at player pos_1_1)
    (at box pos_2_1)
    (goal_pos pos_2_2)

    ;; Define adjacency
    (adjacent pos_0_0 pos_0_1) (adjacent pos_0_1 pos_0_0)
    (adjacent pos_0_1 pos_0_2) (adjacent pos_0_2 pos_0_1)
    (adjacent pos_1_0 pos_1_1) (adjacent pos_1_1 pos_1_0)
    (adjacent pos_1_1 pos_1_2) (adjacent pos_1_2 pos_1_1)
    (adjacent pos_2_0 pos_2_1) (adjacent pos_2_1 pos_2_0)
    (adjacent pos_2_1 pos_2_2) (adjacent pos_2_2 pos_2_1)
    (adjacent pos_0_1 pos_1_1) (adjacent pos_1_1 pos_0_1)
    (adjacent pos_1_1 pos_2_1) (adjacent pos_2_1 pos_1_1)

    ;; Define clear positions
    (clear pos_0_1) (clear pos_1_0) (clear pos_1_2) (clear pos_2_0) (clear pos_2_2)
  )
  (:goal
    (at box pos_2_2)
  )
)