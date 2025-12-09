(define (problem mysteryblocksworld9-prob)
  (:domain mysteryblocksworld9)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    ;; initial cravings and world state as specified
    (craves a d)
    (craves b c)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)

    ;; stage progression: start at s0; provide a linear chain of successor stages.
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
  )

  (:goal (and
    (craves b d)
    (craves d a)
  ))
)