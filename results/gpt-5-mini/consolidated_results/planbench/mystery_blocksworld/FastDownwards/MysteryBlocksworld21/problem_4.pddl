(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    a b c d - object
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    (craves a d)
    (craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province b)

    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )
  (:goal (and
    (craves b c)
    (craves d a)
  ))
)