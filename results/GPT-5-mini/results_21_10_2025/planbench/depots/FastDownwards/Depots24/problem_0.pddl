(define (problem multiagent-problem)
  (:domain multiagent-domain)
  (:objects
    player1 player2 - agent
    l1 l2 l3 - loc
    package1 - item
    d12 - door
  )
  (:init
    ;; agent locations
    (at player1 l1)
    (at player2 l2)

    ;; item location
    (at-item package1 l1)

    ;; map topology
    (door-between d12 l1 l2)
    (door-between d12 l2 l1)
    (connected l2 l3)
    (connected l3 l2)

    ;; keys / door state
    (has-key player2 d12)
    ;; door initially closed: absence of (door-open d12) implies closed
  )
  (:goal (and (at-item package1 l3)))
)