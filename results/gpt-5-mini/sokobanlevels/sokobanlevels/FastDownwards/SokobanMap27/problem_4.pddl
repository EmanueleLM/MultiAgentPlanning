(define (problem sokoban_map27)
  (:domain sokoban)
  (:objects
    player - agent
    box1 - box
    p1 p2 p3 - pos
  )
  (:init
    ;; positions: p1 is player's start, p2 is box start, p3 is goal
    (at player p1)
    (box_at box1 p2)
    (adj p1 p2) (adj p2 p1)
    (adj p2 p3) (adj p3 p2)
    (occupied p1)
    (occupied p2)
    (goal p3)
  )
  (:goal (box_at box1 p3))
)