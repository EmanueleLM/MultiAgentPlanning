(define (problem Depots28-1)
  (:domain Depots28)
  (:objects
    object_0 - object
    object_1 - object
    object_2 - object
    object_3 - object
    object_4 - object
    object_5 - object
    object_6 - object
    object_7 - object
    object_8 - object
    object_9 - object
    object_10 - object
    object_11 - object
    object_12 - object
    object_13 - object
    object_14 - object
  )
  (:init
    (cats object_0)
    (cats object_1)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (hand object_12)
    (hand object_13)
    (hand object_14)
    (next object_0 object_6)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_6)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_9)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )
  (:goal (and
    (next object_12 object_10)
    (next object_13 object_10)
    (next object_14 object_9)
  ))
)