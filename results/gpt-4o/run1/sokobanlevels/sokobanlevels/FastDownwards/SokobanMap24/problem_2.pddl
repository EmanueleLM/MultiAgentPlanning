(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    cell_1_1 cell_1_2 cell_1_3 
    cell_51_1 cell_51_2 cell_51_3
    - cell
    player - entity
    box - entity
  )
  (:init 
    (at player cell_51_2)
    (at box cell_52_2)
    (is_goal cell_1_2)
    
    (adjacent cell_51_2 cell_52_2) (adjacent cell_52_2 cell_51_2)
    (adjacent cell_52_2 cell_53_2) (adjacent cell_53_2 cell_52_2)

    (adjacent cell_1_2 cell_1_1) (adjacent cell_1_1 cell_1_2)
    (adjacent cell_1_2 cell_1_3) (adjacent cell_1_3 cell_1_2)
    
    (is_empty cell_51_1) (is_empty cell_51_3)
    (is_empty cell_1_1) (is_empty cell_1_3)
  )
  (:goal 
    (at box cell_1_2)
  )
)