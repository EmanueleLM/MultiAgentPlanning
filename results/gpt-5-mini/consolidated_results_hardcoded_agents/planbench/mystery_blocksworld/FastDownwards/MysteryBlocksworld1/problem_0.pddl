(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a c d - obj
    agent1 agent2 - agent
  )
  (:init
    ;; No initial (craves ...) facts; agents are represented only by action name prefixes.
    ;; (No extra predicates are required by the domain.)
  )
  (:goal
    (and
      (craves a c)
      (craves d a)
    )
  )
)