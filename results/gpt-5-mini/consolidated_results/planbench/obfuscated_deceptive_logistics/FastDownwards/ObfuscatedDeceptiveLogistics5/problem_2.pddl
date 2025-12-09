(define (problem obfuscated-deceptive-logistics5-problem)
  (:domain obfuscated-deceptive-logistics5)

  (:objects
    ;; typed objects for unary-role facts (moved from :init into types)
    object_9 - hand_obj
    object_0 - cats_obj
    object_3 object_4 - sneeze_obj
    object_1 object_2 - stupendous_obj

    ;; remaining objects (general)
    object_5 object_6 object_7 object_8 - obj
  )

  (:init
    ;; Reduced initial facts: unary role facts (hand, cats, sneeze, stupendous)
    ;; are encoded via object typing above and thus removed from :init.

    ;; Binary/static relations retained (only those explicitly present initially)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (next object_0 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_6)

    (spring object_5)
    (spring object_7)

    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
  )

  (:goal (and
    (next object_9 object_7)
  ))
)