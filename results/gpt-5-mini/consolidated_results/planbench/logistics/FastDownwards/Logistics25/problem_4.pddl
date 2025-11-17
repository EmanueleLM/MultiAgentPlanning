(define (problem Logistics25-problem-0)
  (:domain Logistics25)
  (:objects
    ; typed objects reduce need for explicit predicates in :init
    object_0 - catType
    object_1 object_2 - stupendousType
    object_3 object_4 - sneezeType
    object_5 object_6 object_7 object_8 object_9 object_10 - texturedType
    object_11 object_12 object_13 - handType
    ; for predicates that remain (collect, next, spring) these objects are still of base type object
  )

  (:init
    ;; collect relations (kept explicit)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (kept explicit)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)
    (next object_4 object_10)

    ;; spring properties (remain as predicate)
    (spring object_5)
    (spring object_8)
  )

  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)