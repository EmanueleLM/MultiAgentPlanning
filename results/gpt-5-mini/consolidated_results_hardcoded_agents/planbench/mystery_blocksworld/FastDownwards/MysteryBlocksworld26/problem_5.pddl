(define (problem provinces-problem)
  (:domain provinces)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    (craves a b)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province c)
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )
  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)