(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    p1 p2 p3 - position ; example positions to illustrate concept
    ...
  )

  (:init
    (at player p95) ; example player start position
    (at box p47) ; example box start position
    (goal_at p2) ; example goal position
    (empty p1) (empty p2) (empty p48) ; and other required empty initial positions
    (adjacent p1 p2) (adjacent p2 p3) ; and other adjacency pairs
    ...
  )

  (:goal
    (at box p2) ; goal condition: box must end at goal position
  )
)