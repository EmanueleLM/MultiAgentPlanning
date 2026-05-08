(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player
    box0 - box
    cell_0_0 cell_0_1 cell_1_0 cell_1_1 cell_98_1 cell_99_1 - cell
    ; Add any other necessary grid cells
  )
  
  (:init
    (at player cell_99_1)
    (at box0 cell_98_1)
    (goal cell_1_1)
    (adjacent cell_0_0 cell_0_1)
    (adjacent cell_0_1 cell_0_0)
    (adjacent cell_1_0 cell_1_1)
    (adjacent cell_1_1 cell_1_0)
    (clear cell_0_0)
    ; Include clear predicates for other necessary cells
  )
  
  (:goal
    (and
      (at box0 cell_1_1)
    )
  )
)