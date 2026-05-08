(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    loc-1 loc-2 loc-3 loc-104 loc-105 loc-106 - location
  )
  (:init
    (at-player loc-2)
    (at-box loc-104)
    (goal loc-106)
    ;; Corrected adjacency to reflect vertical movement
    (adjacent loc-1 loc-2) (adjacent loc-2 loc-1)
    (adjacent loc-2 loc-3) (adjacent loc-3 loc-2)
    (adjacent loc-3 loc-104) (adjacent loc-104 loc-3)
    (adjacent loc-104 loc-105) (adjacent loc-105 loc-104)
    (adjacent loc-105 loc-106) (adjacent loc-106 loc-105)
    ;; Mark clear locations dynamically
    (clear loc-1) (clear loc-3) (clear loc-105) (clear loc-106)
  )

  (:goal
    (and
      (at-box loc-106)
    )
  )
)