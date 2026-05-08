(define (problem make-craves)
  (:domain craving-domain)
  (:objects
    a b c d - agent
  )
  (:init
    ; identity markers to bind parameterized, agent-specific actions
    (actor-is-a a)
    (actor-is-b b)
    (actor-is-c c)
    (actor-is-d d)
    ; No initial craves facts: they must be produced by the corresponding agent actions
  )
  (:goal (and
    (craves b a)
    (craves c d)
    (craves d b)
  ))
)