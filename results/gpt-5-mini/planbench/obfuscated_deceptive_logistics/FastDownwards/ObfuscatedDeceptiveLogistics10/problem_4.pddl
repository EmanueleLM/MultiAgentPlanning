(define (problem obfuscated_deceptive_logistics10-problem)
  (:domain obfuscated_deceptive_logistics10)
  ;; Objects: preserved identifiers from the specification
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  ;; Initial state: directly from the provided statement.
  ;; Notes/assumptions (documented as comments):
  ;; - No additional uniqueness or functional constraints are introduced.
  ;; - All predicates and relations are used exactly as given.
  (:init
    ;; hand facts
    (hand object_10)
    (hand object_11)
    (hand object_9)

    ;; cats
    (cats object_0)

    ;; texture facts
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; sneeze facts
    (sneeze object_3)
    (sneeze object_4)

    ;; spring facts
    (spring object_5)
    (spring object_7)

    ;; stupendous facts
    (stupendous object_1)
    (stupendous object_2)

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; next (connectivity) relations
    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)
  )

  ;; Goal: require specific next relations for three hand objects to object_7
  (:goal
    (and
      (next object_10 object_7)
      (next object_11 object_7)
      (next object_9 object_7)
    )
  )
)