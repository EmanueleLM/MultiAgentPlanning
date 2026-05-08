(define (problem sokoban_instance)
  (:domain sokoban)
  (:objects
    p1 p2 p3 p4 p5 p6 - position
  )
  (:init
    (at_player p5)
    (at_box p4)
    (is_goal p3)
    (wall p1) (wall p2) (wall p6)
    (adjacent p5 p4) (adjacent p4 p3)
    (adjacent p2 p3) (adjacent p3 p4)
    (adjacent p5 p6)
  )
  (:goal
    (at_box p3)
  )
)