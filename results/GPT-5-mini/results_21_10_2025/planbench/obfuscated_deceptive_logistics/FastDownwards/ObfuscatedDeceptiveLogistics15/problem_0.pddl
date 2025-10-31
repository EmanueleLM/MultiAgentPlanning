(define (problem logistics-problem-1)
  (:domain logistics-domain)
  (:objects
    r1 - robot
    l1 l2 l3 - location
    p1 p2 - package
  )

  (:init
    ;; robot location and availability
    (at r1 l1)
    (free r1)

    ;; packages initial locations
    (at-pkg p1 l2)
    (at-pkg p2 l1)

    ;; package destinations
    (destination p1 l3)
    (destination p2 l2)

    ;; connectivity (bidirectional)
    (connected l1 l2)
    (connected l2 l1)
    (connected l2 l3)
    (connected l3 l2)
  )

  (:goal (and
    (delivered p1)
    (delivered p2)
  ))
)