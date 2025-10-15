(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )
  (:init
    (hand object_0 object_1)
    (vase object_2 object_3)
    (texture object_4 object_5)
    (next object_6 object_7)
    (cats object_7 object_8)
    (collect object_10 object_11)
    (spring object_12 object_13)
  )
  (:goal
    (and
      (collect object_1 object_2)
      (sneeze object_3 object_4)
      (stupendous object_5 object_6)
    )
  )
)