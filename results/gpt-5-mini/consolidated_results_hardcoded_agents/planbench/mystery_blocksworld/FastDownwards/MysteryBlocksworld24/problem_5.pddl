(define (problem mysteryblocksworld24-problem)
  (:domain mysteryblocksworld24)

  (:objects
    a b c d - object
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; stage declarations (explicit stage objects and links enforce ordered progression)
    (stage s0)
    (stage s1)
    (stage s2)
    (stage s3)
    (stage s4)

    ;; initial current stage
    (current s0)

    ;; explicit linear stage successor relation (actions may only move current along these links)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)

    ;; public initial world facts
    (craves c d)
    (harmony)

    (planet a)
    (planet b)
    (planet d)

    (province a)
    (province b)
    (province c)
  )

  (:goal (and
    (craves a b)
    (craves c a)
  ))
)