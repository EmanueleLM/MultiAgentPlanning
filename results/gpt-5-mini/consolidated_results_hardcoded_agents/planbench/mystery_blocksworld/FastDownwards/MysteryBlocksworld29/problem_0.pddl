; Problem: craving-problem
; Uses domain: craving-domain
; Objects:
;  - a and b are agents
;  - c is an item (also an entity so agents can crave agents or items)
; Initial state contains no craves relations; the only way to obtain the required craves facts is via the agent-specific actions.
(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b - agent
    c - item
  )
  (:init
    ; No initial (craves ...) facts: agents do not initially crave anything.
  )

  (:goal
    (and
      (craves a c)
      (craves b a)
    )
  )
)