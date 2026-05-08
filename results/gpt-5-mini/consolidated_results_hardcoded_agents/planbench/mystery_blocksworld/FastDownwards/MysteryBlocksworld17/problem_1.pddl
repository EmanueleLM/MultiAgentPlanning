(define (problem scenario1)
  (:domain struggle)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - stage
  )
  (:init
    ;; initial craving facts
    (craves a d)
    (craves c a)

    ;; initial harmony and absence of pain
    (harmony)
    ;; (pain) is absent initially

    ;; initial planets and provinces (per-object)
    (planet b)
    (planet d)
    (province b)
    (province c)

    ;; explicit global stage marker and successor chain
    (at-stage s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11)
  )
  ;; Goal matches the user's stated final craving relations exactly (no auxiliary fluents).
  (:goal (and (craves a b) (craves c a) (craves d c)))
)