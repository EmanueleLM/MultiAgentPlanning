(define (problem mystery-instance)
  (:domain MysteryBlocksworld25)
  (:objects
    a b c d - object
    s1 s2 s3 s4 s5 s6 s7 s8 s9 - step
  )

  (:init
    ;; Initial cravings
    (craves b d)
    (craves c a)

    ;; Global harmony present initially
    (harmony)

    ;; Initial planets and provinces
    (planet a)
    (planet d)
    (province b)
    (province c)

    ;; Step ordering and initial current step
    (current s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
  )

  (:goal (and
    (craves a c)
    (craves d a)
    (current s9)
  ))
)