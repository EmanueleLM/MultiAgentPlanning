(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - thing
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )
  (:init
    ;; initial craving relations
    (craves a b)
    (craves b d)
    (craves d c)

    ;; initial properties
    (harmony)
    (planet c)
    (province a)

    ;; stage chain and initial current stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (at-stage s0)
  )

  (:goal (and
    (craves c a)
    (craves d b)
  ))
)