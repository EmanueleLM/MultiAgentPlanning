(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    p1 p2 p3 - position
    player1 - player
    box1 - box
    g1 - goal
  )
  (:init
    (at_player p1)
    (at_box box1 p3)
    (goal p3)
    (adjacent p1 p2)
    (adjacent p2 p3)
    (clear p2)
    (clear g1)
    (goal g1)
  )
  (:goal (and
    (at_box box1 g1)
  ))
)