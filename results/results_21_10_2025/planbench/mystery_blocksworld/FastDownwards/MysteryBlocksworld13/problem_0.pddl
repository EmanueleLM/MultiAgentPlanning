(define (problem move-box-prob)
  (:domain block-move)
  (:objects
    r1 - robot
    b1 - box
    l1 l2 l3 - location
  )
  (:init
    (at r1 l1)
    (box_at b1 l2)
    (connected l1 l2)
    (connected l2 l3)
  )
  (:goal (and (box_at b1 l3)))
)