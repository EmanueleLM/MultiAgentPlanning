(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    player - agent
    box - movable
    goal - target
    l0_0 l0_1 l0_2 l1_0 l1_1 l1_2 l2_0 l2_1 l2_2 l3_0 l3_1 l3_2 l4_0 l4_2 - location
  )
  (:init 
    (at player l4_1)
    (at box l43_1)
    (is_goal l1_1)
    
    (adjacent l0_0 l0_1) (adjacent l0_1 l0_0)
    (adjacent l0_1 l0_2) (adjacent l0_2 l0_1)
    (adjacent l1_0 l1_1) (adjacent l1_1 l1_0)
    (adjacent l1_1 l1_2) (adjacent l1_2 l1_1)
    (adjacent l2_0 l2_1) (adjacent l2_1 l2_0)
    (adjacent l2_1 l2_2) (adjacent l2_2 l2_1)
    (adjacent l3_0 l3_1) (adjacent l3_1 l3_0)
    (adjacent l3_1 l3_2) (adjacent l3_2 l3_1)
    (adjacent l4_0 l4_1) (adjacent l4_1 l4_0)
    (adjacent l4_1 l4_2) (adjacent l4_2 l4_1)

    ;; Additional adjacencies for large grid, example snippet
    (adjacent l4_1 l5_1) (adjacent l5_1 l4_1)
    (adjacent l5_1 l6_1) (adjacent l6_1 l5_1)
    ;; ...
    
    ;; Clear locations
    (is_clear l0_0) (is_clear l0_1) (is_clear l0_2)
    (is_clear l1_0) (is_clear l1_2)
    (is_clear l2_0) (is_clear l2_1) (is_clear l2_2)
    (is_clear l3_0) (is_clear l3_1) (is_clear l3_2)
    (is_clear l4_0) (is_clear l4_2)
  )

  (:goal (and (at box l1_1) (is_goal l1_1)))
)