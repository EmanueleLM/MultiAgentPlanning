(define (problem orchestrated-problem)
  (:domain orchestrated)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11
    object_12 object_13 object_14 - Obj
  )

  (:init
    ;; unary facts (static/environmental tokens provided in initial state)
    (hand object_0)
    (cats object_1)
    (texture object_2)
    (vase object_3)

    (sneeze object_10)
    (spring object_11)
    (spring object_12)
    (stupendous object_13)

    (collect object_9)
    (collect object_14)

    ;; initial next relations (concrete links available to actions)
    (next object_4 object_5)
    (next object_6 object_7)
    (next object_8 object_9)
  )

  ;; Goal: require the explicit terminal condition that a next link exists between the two collect objects
  (:goal (and
    (next object_9 object_14)
  ))
)