(define (problem provinces-problem)
  (:domain provinces)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 - stage
  )
  (:init
    ; initial craving relations
    (craves a b)
    (craves b d)

    ; initial global booleans
    (harmony)

    ; initial planets
    (planet c)
    (planet d)

    ; initial provinces
    (province a)
    (province c)

    ; initial stage: start at s0
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)

    ; explicit distinctness facts for all unequal ordered pairs
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)