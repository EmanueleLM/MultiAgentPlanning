(define (problem orchestrated-problem-A)
  (:domain orchestrated-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - object
  )

  (:init
    ;; unary facts present in the provided Scenario A snapshot (integrated)
    (hand object_12)
    (hand object_13)
    (cats object_0)
    (texture object_10)
    (sneeze object_4)
    (stupendous object_2)
    (spring object_6)

    ;; collect facts present in the snapshot
    (collect object_10 object_3)

    ;; a set of next relations present in the snapshot (examples cited by analysts)
    (next object_0 object_9)
    (next object_11 object_8)
    (next object_12 object_6)
    (next object_13 object_9)

    ;; NOTE: no (vase ...) facts are present in the provided Scenario A snapshot
  )

  (:goal (and
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)