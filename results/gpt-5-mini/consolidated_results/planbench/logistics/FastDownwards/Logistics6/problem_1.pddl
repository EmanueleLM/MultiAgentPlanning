(define (problem scenarioA)
  (:domain Logistics6)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
    s1 s2 s3 s4 s5 s6 s7 s8 - step
  )

  (:init
    ;; Scenario A initial facts (grounded)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_9)
    (next object_0 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_6)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; ordered discrete stages: sufficient length to execute up to seven actions
    (step-succ s1 s2)
    (step-succ s2 s3)
    (step-succ s3 s4)
    (step-succ s4 s5)
    (step-succ s5 s6)
    (step-succ s6 s7)
    (step-succ s7 s8)
    (current-step s1)
  )

  (:goal
    (next object_9 object_7)
  )
)