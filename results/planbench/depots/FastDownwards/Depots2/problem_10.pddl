(define (problem statement-1)
  (:domain depots2)
  (:objects
    object_0 - obj
    object_1 - obj
    object_2 - obj
    object_3 - obj
    object_4 - obj
    object_5 - obj
    object_6 - obj
    object_7 - obj
    object_8 - obj
  )
  (:init
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_5)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
  )
  (:goal
    (and
      (next object_7 object_6)
      (next object_8 object_6)
    )
  )
)