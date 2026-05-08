(define (problem mysteryblocksworld29-prob)
  (:domain mysteryblocksworld29)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 - stage
  )
  (:init
    (craves a c)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)

    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (now s0)
  )
  (:goal (and
    (craves a c)
    (craves b a)
  ))
)