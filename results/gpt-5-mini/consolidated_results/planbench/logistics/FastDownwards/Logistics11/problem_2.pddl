(define (problem logistics11-scenarioA)
  (:domain logistics11)
  (:objects
    ;; typed objects to encode many unary facts via types (reduces :init size)
    object_9 object_10 object_11 - hand
    object_0 - cat
    object_3 object_4 - sneeze
    object_1 object_2 - stupendous

    ;; remaining objects declared as generic objects; their texture/spring membership
    ;; will be provided as the minimal set of unary facts in :init
    object_5 object_6 object_7 object_8 - obj
  )
  (:init
    ;; keep only the unary facts that cannot be encoded via typing without breaking usage
    ;; (spring and texture remain predicates for objects used in both roles)
    (spring object_5)
    (spring object_7)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; binary relations (kept as originally required)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)
  )
  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_9 object_7)
  ))
)