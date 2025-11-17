(define (problem Logistics24-problem-1)
  (:domain Logistics24)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect relations
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; hands
    (hand object_12)
    (hand object_13)

    ;; next relations (initial)
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)

    ;; sneezes
    (sneeze object_4)
    (sneeze object_5)

    ;; springs
    (spring object_6)
    (spring object_9)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; textures
    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal (and
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)