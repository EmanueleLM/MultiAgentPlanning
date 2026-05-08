(define (problem mysteryblocksworld27)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 - stage
  )

  (:init
    ;; initial craves and world fluents
    (craves a d)
    (craves c b)
    (harmony)
    (planet b)
    (planet d)
    (province a)
    (province c)

    ;; explicit stage ordering (successor relation)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)

    ;; the current global stage (actions must advance this)
    (now-stage s0)
  )

  (:goal (and
    (craves b a)
    (craves c b)
    (craves d c)
  ))
)