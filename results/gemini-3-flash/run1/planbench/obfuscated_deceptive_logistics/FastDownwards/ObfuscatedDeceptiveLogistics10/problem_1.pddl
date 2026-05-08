(define (problem logistics_problem_10)
  (:domain logistics_deceptive)
  (:objects
    object_0 - cats
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_5 object_7 - spring
    object_6 object_8 - texture
    object_9 object_10 object_11 - hand
  )
  (:init
    (hand object_9)
    (hand object_10)
    (hand object_11)
    (cats object_0)
    (sneeze object_3)
    (sneeze object_4)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
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