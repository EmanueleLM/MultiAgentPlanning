(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    loc-1 loc-2 loc-3 loc-104 loc-105 - location
  )
  (:init
    (at-player loc-2)
    (at-box loc-104)
    (goal loc-105)
    ;; Adjacency for simplified single-file corridor
    (adjacent loc-1 loc-2) (adjacent loc-2 loc-1)
    (adjacent loc-2 loc-3) (adjacent loc-3 loc-2)
    (adjacent loc-104 loc-105) (adjacent loc-105 loc-104)
    ;; Clear aside from player start and box start
    (clear loc-1) (clear loc-3) (clear loc-105)
  )

  (:goal
    (and
      (at-box loc-105)
    )
  )
)