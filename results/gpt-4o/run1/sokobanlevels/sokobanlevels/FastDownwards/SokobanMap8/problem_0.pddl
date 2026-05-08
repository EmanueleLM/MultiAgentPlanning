(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player
    box0 - box
    ; Include any necessary grid cells
    cell_0_0 cell_1_0 cell_1_1 ... ; (define each cell)
  )
  
  (:init
    (at player cell_99_1)
    (at box0 cell_98_1)
    (goal cell_1_1)
    (adjacent cell_0_0 cell_0_1) ; Define all necessary adjacencies
    (adjacent cell_1_0 cell_1_1)
    ...
    ; Define all necessary clear cells (not walls, not initially occupied)
    (clear cell_0_0)
    ...
  )
  
  (:goal
    (and
      (at box0 cell_1_1)
    )
  )
)