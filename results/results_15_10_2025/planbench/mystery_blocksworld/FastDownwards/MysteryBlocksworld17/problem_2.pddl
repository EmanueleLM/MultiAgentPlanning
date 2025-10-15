(define (problem orchestrator-problem-variant1)
  (:domain orchestrator-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)
    (stupendous object_2)
    (stupendous object_3)
  )

  (:goal (and
    (stupendous object_2)
    (stupendous object_3)
  ))
)