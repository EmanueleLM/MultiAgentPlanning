(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    cell_1_1 cell_1_2 cell_1_3 cell_2_1 cell_2_2 cell_2_3 cell_3_1 cell_3_2 cell_3_3
    cell_52_2 - cell
    player - entity
    box - entity
  )
  (:init 
    (at player cell_52_2)
    (at box cell_52_2)
    (is_goal cell_2_2)
    
    ; Define adjacency for movable cells
    (adjacent cell_51_2 cell_52_2) (adjacent cell_52_2 cell_51_2)
    (adjacent cell_52_2 cell_53_2) (adjacent cell_53_2 cell_52_2)
    
    ; Adjacent positions relating to goal region
    (adjacent cell_2_1 cell_2_2) (adjacent cell_2_2 cell_2_1)
    (adjacent cell_2_2 cell_2_3) (adjacent cell_2_3 cell_2_2)
    (adjacent cell_2_2 cell_1_2) (adjacent cell_1_2 cell_2_2)
    (adjacent cell_2_2 cell_3_2) (adjacent cell_3_2 cell_2_2)
    
    ; Specify the start as empty aside from player and box
    (is_empty cell_1_2) (is_empty cell_3_2)
  )
  (:goal 
    (at box cell_2_2)
  )
)