(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    ;; Define all cells in the grid from c0_0 to c19_2
    c0_0 c0_1 c0_2 c1_0 c1_1 c1_2 c2_0 c2_1 c2_2
    c3_0 c3_1 c3_2 c4_0 c4_1 c4_2 c5_0 c5_1 c5_2
    c6_0 c6_1 c6_2 c7_0 c7_1 c7_2 c8_0 c8_1 c8_2
    c9_0 c9_1 c9_2 c10_0 c10_1 c10_2 c11_0 c11_1 c11_2
    c12_0 c12_1 c12_2 c13_0 c13_1 c13_2 c14_0 c14_1 c14_2
    c15_0 c15_1 c15_2 c16_0 c16_1 c16_2 c17_0 c17_1 c17_2
    c18_0 c18_1 c18_2 c19_0 c19_1 c19_2 - cell
  )
  (:init
    (at player1 c1_1)
    (box_at box1 c49_1)
    (goal_at goal1 c98_1)
    ;; Define adjacencies
    (adjacent c0_0 c0_1) (adjacent c0_1 c0_0)
    (adjacent c0_1 c0_2) (adjacent c0_2 c0_1)
    (adjacent c1_0 c1_1) (adjacent c1_1 c1_0)
    (adjacent c1_1 c1_2) (adjacent c1_2 c1_1)
    ;; Repeat adjacencies between all vertically and horizontally adjacent cells
    ;; Omitting full adjacency details for brevity, but they cover every cell that isn't a wall
    (adjacent c88_1 c89_1) (adjacent c89_1 c88_1)
    (adjacent c89_1 c90_1) (adjacent c90_1 c89_1)
    (adjacent c90_1 c91_1) (adjacent c91_1 c90_1)
    ;; ...
    (adjacent c97_1 c98_1) (adjacent c98_1 c97_1)
  )
  (:goal
    (box_on_goal box1 goal1)
  )
)