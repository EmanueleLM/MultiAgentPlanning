(define (problem Logistics4-problem-instance1)
  (:domain Logistics4-multiagent)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
  )

  ;; Initial state: exactly the facts from the first statement block in the human specification
  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect relations
    (collect object_6 object_2)
    (collect object_7 object_3)

    ;; hands
    (hand object_8)
    (hand object_9)

    ;; next relations
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (next object_9 object_7)

    ;; sneezes
    (sneeze object_4)
    (sneeze object_5)

    ;; springs
    (spring object_6)
    (spring object_7)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; textures
    (texture object_6)
    (texture object_7)
  )

  ;; Goal: require next object_8 object_7 to hold (it already does) and achieve next object_9 object_6.
  ;; The provided proposed_solution's 4 actions produce next object_9 object_6 while preserving next object_8 object_7.
  (:goal (and
    (next object_8 object_7)
    (next object_9 object_6)
  ))
)