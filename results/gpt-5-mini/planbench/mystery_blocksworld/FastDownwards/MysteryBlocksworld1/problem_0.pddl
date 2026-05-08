(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a c d - entity
    agent1 agent2 - agent
  )

  ;; Initial state:
  ;; - No craves facts initially.
  ;; - target-agent1(a,c) enforces that only agent1 may (and must) establish (craves a c).
  ;; - target-agent2(d,a) enforces that only agent2 may (and must) establish (craves d a).
  (:init
    (target-agent1 a c)
    (target-agent2 d a)
  )

  ;; Global goal: a must crave c, and d must crave a.
  (:goal (and
           (craves a c)
           (craves d a)
         )
  )
)