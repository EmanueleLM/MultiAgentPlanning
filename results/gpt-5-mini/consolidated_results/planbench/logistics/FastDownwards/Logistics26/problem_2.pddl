(define (problem logistics26-scenario-1)
  (:domain Logistics26)
  (:objects
    object_0 - cats
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_5 object_6 object_7 object_8 object_9 object_10 - texture
    object_11 object_12 object_13 - hand
  )
  (:init
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_7)
    (next object_13 object_7)
    (next object_3 object_6)
    (next object_4 object_9)

    (spring object_5)
    (spring object_8)
  )
  (:goal (and
    (next object_11 object_5)
    (next object_12 object_9)
    (next object_13 object_10)
  ))
)

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
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    (spring object_6)
    (spring object_9)
  )
  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))
)