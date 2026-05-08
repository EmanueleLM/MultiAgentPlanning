(define (problem orchestrator-problem)
  (:domain orchestrator)
  ;; Objects: preserve identifiers from the input
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  ;; Initial state: taken directly from the provided specification.
  ;; Assumptions (documented): predicates are used as given; no extra uniqueness
  ;; constraints (e.g., unique successor) are enforced beyond action effects.
  (:init
    ;; hands
    (hand object_10)
    (hand object_11)
    (hand object_9)

    ;; cats
    (cats object_0)

    ;; textures
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; sneezes
    (sneeze object_3)
    (sneeze object_4)

    ;; springs
    (spring object_5)
    (spring object_7)

    ;; stupendous markers
    (stupendous object_1)
    (stupendous object_2)

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; next relations (connectivity)
    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)
  )

  ;; Goal: require final connectivity for the three hand objects to object_7
  (:goal
    (and
      (next object_10 object_7)
      (next object_11 object_7)
      (next object_9 object_7)
    )
  )
)