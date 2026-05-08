(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    cell_1 cell_2 cell_3 cell_4 - cell
    cell_5 cell_6 cell_7 cell_8 - cell
    start goal - wall
  )
  (:init
    (at-player player1 cell_4)
    (at-box box1 cell_3)
    (goal cell_1)
    (free cell_2) (free cell_4)
    (adjacent cell_1 cell_2)
    (adjacent cell_2 cell_1)
    (adjacent cell_2 cell_3)
    (adjacent cell_3 cell_2)
    (adjacent cell_3 cell_4)
    (adjacent cell_4 cell_3)
  )
  (:goal
    (at-box box1 cell_1)
  )
)