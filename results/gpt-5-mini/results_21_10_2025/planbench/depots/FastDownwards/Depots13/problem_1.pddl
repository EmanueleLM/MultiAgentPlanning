(define (problem orchestrated-problem)
  (:domain orchestrated)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; hands
    (hand object_10)
    (hand object_11)
    (hand object_12)

    ;; sneezes
    (sneeze object_4)
    (sneeze object_5)

    ;; textures
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; springs
    (spring object_6)
    (spring object_8)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; collect relations (actor1 initial)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; next relations (actor1 initial)
    (next object_0 object_6)
    (next object_1 object_8)
    (next object_10 object_9)
    (next object_11 object_6)
    (next object_12 object_6)
    (next object_4 object_7)
    (next object_5 object_8)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
  ))
)