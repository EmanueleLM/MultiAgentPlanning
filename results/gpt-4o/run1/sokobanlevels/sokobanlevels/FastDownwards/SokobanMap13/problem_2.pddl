(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    p1 p2 p3 - position
    box1 - box
    player1 - agent
  )
  (:init
    (at player1 p2)
    (at-box box1 p3)
    (clear p1)
    (adjacent p2 p1)
    (adjacent p3 p2)
    (goal p1)
  )
  (:goal
    (at-box box1 p1)
  )
)