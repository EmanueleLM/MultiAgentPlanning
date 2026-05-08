(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player_type
    box - box_type
    goal - goal_type
    cell_1_1 cell_1_2 cell_1_3 cell_2_2 cell_2_3 cell_3_3 cell_2_1 cell_3_2 - cell_type
  )
  (:init
    (player_at player cell_1_1)
    (box_at box cell_2_2)
    (goal_at goal cell_3_3)
    (empty cell_1_2)
    (empty cell_1_3)
    (empty cell_3_2)
    (empty cell_2_3)
    (adjacent cell_1_1 cell_1_2)
    (adjacent cell_1_2 cell_1_1)
    (adjacent cell_1_2 cell_2_2)
    (adjacent cell_2_2 cell_1_2)
    (adjacent cell_2_2 cell_3_2)
    (adjacent cell_3_2 cell_2_2)
    (adjacent cell_2_2 cell_2_3)
    (adjacent cell_2_3 cell_2_2)
    (adjacent cell_2_3 cell_3_3)
    (adjacent cell_3_3 cell_2_3)
  )
  (:goal
    (box_at box cell_3_3)
  )
)