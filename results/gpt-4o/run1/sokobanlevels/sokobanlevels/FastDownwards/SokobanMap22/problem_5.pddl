(define (problem sokoban-map22)
  (:domain sokoban)
  (:objects
    player1 - entity
    box1 - entity
    cell-1-1 cell-1-2 cell-1-3
    cell-2-1 cell-2-2 cell-2-3
    cell-3-1 cell-3-2 cell-3-3
  )
  (:init
    (player player1)
    (box box1)
    (at player1 cell-3-2)
    (at box1 cell-2-2)
    (goal-cell cell-1-2)

    (adjacent cell-1-1 cell-1-2) (adjacent cell-1-2 cell-1-1)
    (adjacent cell-1-2 cell-1-3) (adjacent cell-1-3 cell-1-2)
    (adjacent cell-2-1 cell-2-2) (adjacent cell-2-2 cell-2-1)
    (adjacent cell-2-2 cell-2-3) (adjacent cell-2-3 cell-2-2)
    (adjacent cell-3-1 cell-3-2) (adjacent cell-3-2 cell-3-1)
    (adjacent cell-3-2 cell-3-3) (adjacent cell-3-3 cell-3-2)
    
    (adjacent cell-1-1 cell-2-1) (adjacent cell-2-1 cell-1-1)
    (adjacent cell-1-2 cell-2-2) (adjacent cell-2-2 cell-1-2)
    (adjacent cell-1-3 cell-2-3) (adjacent cell-2-3 cell-1-3)
    (adjacent cell-2-1 cell-3-1) (adjacent cell-3-1 cell-2-1)
    (adjacent cell-2-2 cell-3-2) (adjacent cell-3-2 cell-2-2)
    (adjacent cell-2-3 cell-3-3) (adjacent cell-3-3 cell-2-3)

    (clear cell-1-1) (clear cell-1-3)
    (clear cell-2-1) (clear cell-2-3)
    (clear cell-3-1) (clear cell-3-3)
  )
  (:goal (at box1 cell-1-2))
)