(define (problem obfuscated-deceptive-logistics11-problem)
  (:domain obfuscated-deceptive-logistics11)

  (:objects
    object_0 - cats
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_9 object_10 object_11 - hand
    object_5 object_6 object_7 object_8 - obj
  )

  (:init
    ;; collect relations (only those required by the plan)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; initial next relations used as preconditions in the plan
    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)

    ;; springs (only those required)
    (spring object_5)
    (spring object_7)

    ;; textures (only those required)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
  )

  (:goal
    (and
      (next object_10 object_7)
      (next object_11 object_7)
      (next object_9 object_7)
    )
  )
)