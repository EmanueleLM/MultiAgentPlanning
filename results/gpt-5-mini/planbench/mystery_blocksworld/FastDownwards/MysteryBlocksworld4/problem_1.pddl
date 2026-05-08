(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - item
    agent1 agent2 auditor - agent
  )
  (:init
  )
  (:goal (and
    (craves a b)
    (craves d c)
  ))
)