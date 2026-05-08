(define (problem orchestrated-problem)
  (:domain orchestrated)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; unary type-like predicates (treated as static by model)
    (cats object_0)
    (cats object_1)

    (hand object_12)
    (hand object_13)
    (hand object_14)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)
    (texture object_11)

    ;; collect facts (partitioned collector groups per provided input)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (collect object_9 object_3)
    (collect object_10 object_3)
    (collect object_11 object_3)

    ;; next links (initial pointers)
    (next object_0 object_6)
    (next object_1 object_9)
    (next object_4 object_7)
    (next object_5 object_10)
    (next object_12 object_11)
    (next object_13 object_6)
    (next object_14 object_8)
  )

  ;; Goals requested by the user are encoded as strict terminal conditions.
  ;; Note: based on the given initial facts and the provided action schemas,
  ;; not all of these goals may be achievable without additional facts or
  ;; domain edits. The goals are encoded exactly as requested.
  (:goal (and
    (next object_12 object_10)
    (next object_13 object_10)
    (next object_14 object_9)
  ))
)