(define (problem scenario1_with_verified_plan)
  (:domain orchestrator)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 - object
  )
  (:init
    ;; unary predicates
    (cats object_0)
    (cats object_1)

    (hand object_12)
    (hand object_13)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; collect relations
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; next relations (initial)
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)
  )
  ;; The goal is to reach next object_12 object_10 and next object_13 object_9.
  ;; The included domain enforces that only the defined actions can modify 'next' and 'vase',
  ;; and their preconditions reflect the exact constraints described in the specification.
  (:goal (and
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)