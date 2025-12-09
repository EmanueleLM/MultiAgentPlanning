(define (problem orchestrator-problem)
  (:domain orchestration-domain)
  (:objects
    a b c d - entity
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    (craves c b)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
    (current s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )

  (:goal (craves a b))
)