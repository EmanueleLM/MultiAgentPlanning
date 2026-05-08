(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    p0 p1 p2 p43 p44 p45 p46 p47 p48 p49 p50 - position
  )

  (:init
    (at player p50)
    (at box p47)
    (goal p2)
    ;; Adjacency conditions for movement and pushing
    (adjacent p46 p47) (adjacent p47 p48)
    (adjacent p48 p49) (adjacent p49 p50)
    (adjacent p2 p1)
    (adjacent p47 p46) (adjacent p48 p47)
    (adjacent p49 p48) (adjacent p50 p49)
    (adjacent p1 p2) ;; Backwards adjacency allowing backtracking effects
    ;; Established empty spaces
    (empty p46) (empty p48) (empty p49) (empty p2) (empty p1)
  )

  (:goal
    (at box p2)
  )
)