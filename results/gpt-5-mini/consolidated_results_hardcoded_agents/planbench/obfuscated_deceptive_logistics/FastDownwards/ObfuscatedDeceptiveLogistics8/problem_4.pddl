(define (problem obfuscated_deceptive_logistics_problem)
  (:domain obfuscated_deceptive_logistics)

  (:objects
    ;; typed objects to encode several unary "role" facts as types (reduces init size)
    object_0 - cat
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_9 object_10 - hand
    object_5 object_6 object_7 object_8 - obj
  )

  (:init
    ;; relation facts (kept only those non-unary or overlapping roles that are necessary
    ;; to preserve reachability according to the specification)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (next object_0 object_5)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_5)

    (spring object_5)
    (spring object_7)

    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
  )

  (:goal
    (and
      (next object_10 object_6)
      (next object_9 object_6)
    )
  )
)