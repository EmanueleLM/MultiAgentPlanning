(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    cell_1 cell_2 cell_3 cell_4 cell_5 cell_6 cell_7 cell_8 - cell
    goal_cell - goal_cell
  )
  (:init
    (at-player player1 cell_8)
    (at-box box1 cell_6)
    (goal cell_2)
    (free cell_7)
    (free cell_8)
    (adjacent cell_8 cell_7)
    (adjacent cell_7 cell_6)
    (adjacent cell_6 cell_5)
    (adjacent cell_5 goal_cell)
    (adjacent cell_2 goal_cell)
  )
  (:goal
    (at-box box1 goal_cell)
  )
)