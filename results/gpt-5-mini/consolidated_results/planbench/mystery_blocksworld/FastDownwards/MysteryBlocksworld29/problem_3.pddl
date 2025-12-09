(define (problem mysteryblocksworld29-prob)
  (:domain mysteryblocksworld29)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 - stage
  )
  (:init
    ;; initial cravings and control
    (craves a c)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)

    ;; explicit stage ordering and current time (enforces contiguous single-step progression)
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