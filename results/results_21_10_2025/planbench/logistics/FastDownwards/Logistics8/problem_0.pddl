; FastDownwards
(define (problem scenario-a)
  (:domain multi-agent-delivery)
  (:objects
    r1 r2 - agent
    p1 p2 - package
    l1 l2 l3 - location
  )
  (:init
    ;; agent locations
    (at r1 l1)
    (at r2 l3)

    ;; packages initial locations
    (package-at p1 l1)
    (package-at p2 l3)

    ;; connections (bidirectional)
    (connected l1 l2)
    (connected l2 l1)
    (connected l2 l3)
    (connected l3 l2)
  )
  (:goal (and
    ;; swap packages: p1 must go to l3, p2 to l1
    (package-at p1 l3)
    (package-at p2 l1)
  ))
)