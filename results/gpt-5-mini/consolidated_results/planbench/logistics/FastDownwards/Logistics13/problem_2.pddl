(define (problem Logistics13-problem)
  (:domain Logistics13)
  (:objects
    object_10 object_11 object_12 - hand
    object_0 object_1 - cat
    object_4 object_5 - sneeze
    object_2 object_3 - stupendous
    object_6 object_7 object_8 object_9 - obj
  )
  (:init
    ;; collect relations (kept minimal - those required by wretched uses)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; next relations (initial statement - second variant)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_12 object_6)
    (next object_4 object_6)
    (next object_5 object_9)

    ;; textures (only where needed)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; springs (only where needed)
    (spring object_6)
    (spring object_8)
  )
  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))
)