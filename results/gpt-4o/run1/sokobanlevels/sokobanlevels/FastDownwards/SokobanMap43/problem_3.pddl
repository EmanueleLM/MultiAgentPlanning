(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 
    - number
  )

  (:init
    (at_player 1 0)
    (at_box 30 0)
    (goal 98 0)
    (clear 2 0) (clear 3 0) (clear 4 0) (clear 5 0) ...
    ; specify all clear locations assuming a linear/adjacency grid structure

    (adjacent 0 0 1 0) (adjacent 1 0 2 0) ... 
    (adjacent 29 0 30 0) (adjacent 30 0 31 0) (adjacent 97 0 98 0)
  )

  (:goal
    (at_box 98 0)
  )
)