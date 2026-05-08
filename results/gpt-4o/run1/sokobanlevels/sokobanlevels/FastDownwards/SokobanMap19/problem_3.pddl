(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    ;; Adding necessary cells for the grid: 
    c0_0 c0_1 c0_2 c1_0 c1_1 c1_2 c2_0 c2_1 c2_2
    ;; continue defining all necessary cells consistent with the scenario
    c49_1 c98_1 - cell
  )
  (:init
    (at player1 c1_1)
    (box_at box1 c49_1)
    (goal_at goal1 c98_1)
    ;; Define correct adjacencies
    (adjacent c0_1 c1_1) (adjacent c1_1 c0_1)
    (adjacent c1_1 c2_1) (adjacent c2_1 c1_1)
    (adjacent c2_1 c3_1) (adjacent c3_1 c2_1)
    ;; Ensure all relevant adjacencies are defined
  )
  (:goal
    (box_on_goal box1 goal1)
  )
)