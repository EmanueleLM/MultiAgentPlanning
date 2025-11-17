(define (problem logistics17-problemA)
  (:domain Logistics17)
  (:objects
    object_0 - cat
    object_1 - cat
    object_2 - stup_t
    object_3 - stup_t
    object_4 - sneeze_t
    object_5 - sneeze_t
    object_6 - spring_t
    object_7 - obj
    object_8 - spring_t
    object_9 - obj
    object_10 - hand
    object_11 - hand
    object_12 - hand
    object_13 - hand
  )

  (:init
    ;; collect relations (kept as required by wretched preconditions)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; next relations (initial variant A)
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_11 object_8)
    (next object_12 object_9)
    (next object_13 object_6)
    (next object_4 object_7)
    (next object_5 object_9)

    ;; texture markers (required by actions that take a texture parameter)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal (and
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)