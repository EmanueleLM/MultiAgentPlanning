(define (problem mysteryblocksworld24-problem)
  (:domain mysteryblocksworld24)

  (:objects
    a b c d - object
    s0 s1 s2 s3 s4 - time
  )

  (:init
    ;; initial predicates from the human specification
    (craves c d)
    (harmony)

    (planet a)
    (planet b)
    (planet d)

    (province a)
    (province b)
    (province c)

    ;; time ordering (discrete stages). Initial current stage is s0.
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (current s0)
  )

  (:goal (and
    (craves a b)
    (craves c a)
  ))
)