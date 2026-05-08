(define (problem sokoban-problem-1)
  (:domain sokoban)
  (:objects
    player-1 - entity
    box-1 - entity
    cell-1-1 cell-1-2 cell-1-3
    cell-2-1 cell-2-2 cell-2-3
    cell-3-1 cell-3-2 cell-3-3
    cell-52-1 cell-52-2 cell-52-3
    cell-53-1 cell-53-2 cell-53-3
  )
  (:init
    (player player-1)
    (box box-1)
    (at player player-1 cell-53-2)
    (at box box-1 cell-52-2)
    (goal-cell cell-2-2)
    
    (adjacent cell-1-1 cell-2-1) (adjacent cell-2-1 cell-1-1)
    (adjacent cell-1-2 cell-2-2) (adjacent cell-2-2 cell-1-2)
    (adjacent cell-1-3 cell-2-3) (adjacent cell-2-3 cell-1-3)
    (adjacent cell-2-1 cell-3-1) (adjacent cell-3-1 cell-2-1)
    (adjacent cell-2-2 cell-3-2) (adjacent cell-3-2 cell-2-2)
    (adjacent cell-2-3 cell-3-3) (adjacent cell-3-3 cell-2-3)
    (adjacent cell-52-1 cell-53-1) (adjacent cell-53-1 cell-52-1)
    (adjacent cell-52-2 cell-53-2) (adjacent cell-53-2 cell-52-2)
    (adjacent cell-52-3 cell-53-3) (adjacent cell-53-3 cell-52-3)
    
    (clear cell-1-1) (clear cell-1-2) (clear cell-1-3)
    (clear cell-2-1) (clear cell-2-3)
    (clear cell-3-1) (clear cell-3-2) (clear cell-3-3)
    (clear cell-52-1) (clear cell-52-3)
    (clear cell-53-3)
  )
  (:goal (at box box-1 cell-2-2))
)