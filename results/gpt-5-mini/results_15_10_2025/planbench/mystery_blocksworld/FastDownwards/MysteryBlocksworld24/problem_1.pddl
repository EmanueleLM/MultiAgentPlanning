(define (problem mystery-blocksworld-p1)
  (:domain mystery-blocksworld)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - object
  )
  (:init
    (hand object_0)
    (cats object_1)
    (next object_2 object_3)
    (texture object_4)
    (sneeze object_5)
    (stupendous object_6)
    (spring object_7)
    (collect object_8)
  )
  (:goal (and (collect object_0) (vase object_1) (texture object_3)))
)