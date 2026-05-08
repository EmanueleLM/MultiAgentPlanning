(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - item
    agent1 agent2 auditor - agent
  )
  (:init
    ;; No initial craves or audited facts: declarations must be performed by the respective agents.
  )
  (:goal (and
    (craves a b)
    (craves d c)
  ))
)