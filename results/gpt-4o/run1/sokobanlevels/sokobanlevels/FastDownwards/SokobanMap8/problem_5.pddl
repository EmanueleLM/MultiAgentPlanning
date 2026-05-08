(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player
    box0 - box
    cell_0_0 cell_0_1 cell_0_2 cell_1_0 cell_1_1 cell_1_2 cell_2_0 cell_2_1 cell_2_2 - cell
  )
  
  (:init
    (at player cell_2_1)
    (at box0 cell_1_1)
    (clear cell_1_2)
    (clear cell_2_0)
    (clear cell_2_2)
    (goal cell_1_0)
    
    ; Define adjacencies, ensure they reflect the real map layout
    (adjacent cell_0_0 cell_0_1)
    (adjacent cell_0_1 cell_0_0)
    (adjacent cell_0_1 cell_0_2)
    (adjacent cell_0_2 cell_0_1)
    (adjacent cell_1_0 cell_1_1)
    (adjacent cell_1_1 cell_1_0)
    (adjacent cell_1_1 cell_1_2)
    (adjacent cell_1_2 cell_1_1)
    (adjacent cell_2_0 cell_2_1)
    (adjacent cell_2_1 cell_2_0)
    (adjacent cell_2_1 cell_2_2)
    (adjacent cell_2_2 cell_2_1)
  )
  
  (:goal
    (at box0 cell_1_0)
  )
)