(define (problem harmony-problem)
  (:domain harmony-domain)
  (:objects
    a b c d - object
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 - stage
  )

  (:init
    ; initial craves relations
    (craves c a)
    (craves d c)

    ; global booleans
    (harmony)

    ; planet facts
    (planet a)
    (planet b)

    ; initial province facts
    (province b)
    (province d)

    ; stage chain and initial current stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (current s0)

    ; distinct facts for all unequal ordered pairs (explicit inequality encoding)
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  (:goal (and
           (craves b c)
           (craves d a)
         )
  )
)