(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    p1 p2 p3 p47 p95 - position
  )

  (:init
    (at player p95)
    (at box p47)
    (goal_at p2)
    (empty p1) (empty p2) (empty p48)
    (adjacent p1 p2) (adjacent p2 p3)
  )

  (:goal
    (at box p2)
  )
)