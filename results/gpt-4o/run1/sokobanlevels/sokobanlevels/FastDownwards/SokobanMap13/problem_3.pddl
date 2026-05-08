(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    p1 p2 p3 p4 - position
    box1 - box
    player1 - agent
  )
  (:init
    (at player1 p1)
    (at-box box1 p2)
    (clear p3)
    (adjacent p1 p2)
    (adjacent p2 p3)
    (adjacent p3 p4)
    (goal p4)
  )
  (:goal
    (at-box box1 p4)
  )
)