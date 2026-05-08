(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player_type
    box - box_type
    goal - goal_type
    cell_1_1 cell_45_2 cell_98_2 - cell_type
    ; Add other cell names here for completeness
  )
  (:init
    (player_at player cell_1_1)
    (box_at box cell_45_2)
    (goal_at goal cell_98_2)
    (empty cell_x_y) ; List all empty cells excluding wall positions
    ; Define all adjacency relations for the cells
    (adjacent cell_x_y cell_xprime_yprime) ; Use actual cell coordinates
  )
  (:goal
    (box_at box cell_98_2)
  )
)