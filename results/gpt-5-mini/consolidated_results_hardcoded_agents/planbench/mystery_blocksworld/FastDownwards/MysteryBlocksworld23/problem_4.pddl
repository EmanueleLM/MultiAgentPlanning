(define (problem mysteryblocksworld23-prob)
  (:domain mysteryblocksworld23)

  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ; initial cravings
    (craves b a)
    (craves d b)

    ; initial global phase and current stage (harmony at s0)
    (harmony)
    (current s0)

    ; discrete stage ordering and phase assignment (explicit)
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)

    (phase_harmony s0)
    (phase_pain s1)
    (phase_harmony s2)
    (phase_pain s3)
    (phase_harmony s4)

    ; initial object typing and province/planet assignments
    (planet a)
    (planet c)

    (province c)
    (province d)
  )

  (:goal (and
    (craves b d)
  ))
)