(define (problem mysteryblocksworld24-problem)
  (:domain mysteryblocksworld24)

  (:objects
    a b c d - object
    s0 s1 s2 s3 s4 - time
  )

  (:init
    (craves c d)
    (harmony)

    (planet a)
    (planet b)
    (planet d)

    (province a)
    (province b)
    (province c)

    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (current s0)

    ;; explicit distinctness facts for all ordered unequal object pairs
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  (:goal (and
    (craves a b)
    (craves c a)
  ))
)