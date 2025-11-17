(define (problem logistics26-scenario-2)
  (:domain Logistics26)
  (:objects
    object_0 object_1 - cats
    object_2 object_3 - stupendous
    object_4 object_5 - sneeze
    object_6 object_7 object_8 object_9 object_10 object_11 - texture
    object_12 object_13 object_14 - hand
  )
  (:init
    ;; collect facts
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; next relations (contiguous occupancy is enforced by action effects)
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    ;; spring-capable locations
    (spring object_6)
    (spring object_9)
  )
  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))
)