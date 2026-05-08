(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    c0_1 c1_1 c2_1 c3_1 c4_1 c5_1 c6_1 c7_1 c8_1 c9_1 c10_1 
    c11_1 c12_1 c13_1 c14_1 c15_1 c16_1 c17_1 c18_1 c19_1 
    c20_1 c21_1 c22_1 c23_1 c24_1 c25_1 c26_1 c27_1 c28_1 
    c29_1 c30_1 c31_1 c32_1 c33_1 c34_1 c35_1 c36_1 c37_1 
    c38_1 c39_1 c40_1 c41_1 c42_1 c43_1 c44_1 c45_1 c46_1 
    c47_1 c48_1 c49_1 
    c50_1 c51_1 c52_1 c53_1 c54_1 c55_1 c56_1 c57_1 c58_1 
    c59_1 c60_1 c61_1 c62_1 c63_1 c64_1 c65_1 c66_1
    c67_1 c68_1 c69_1 c70_1 c71_1 c72_1 c73_1 c74_1 c75_1 
    c76_1 c77_1 c78_1 c79_1 c80_1 c81_1 c82_1 c83_1 c84_1 
    c85_1 c86_1 c87_1 c88_1 c89_1 c90_1 c91_1 c92_1 c93_1 
    c94_1 c95_1 c96_1 c97_1 c98_1
    - cell
  )
  (:init
    (at player1 c1_1)
    (box_at box1 c49_1)
    (goal_at goal1 c98_1)
    (adjacent c0_1 c1_1) (adjacent c1_1 c0_1)
    (adjacent c1_1 c2_1) (adjacent c2_1 c1_1)
    (adjacent c2_1 c3_1) (adjacent c3_1 c2_1)
    ;; Continue defining adjacencies until a complete path from start to goal is defined
  )
  (:goal
    (box_on_goal box1 goal1)
  )
)