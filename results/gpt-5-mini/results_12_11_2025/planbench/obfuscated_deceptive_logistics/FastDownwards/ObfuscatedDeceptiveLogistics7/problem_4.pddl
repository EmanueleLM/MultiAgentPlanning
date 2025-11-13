(define (problem scenario1_obfuscated)
  (:domain obfuscated_deceptive_logistics7)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 - stage
  )

  (:init
    ;; enforce contiguous stage progression and initial phase
    (current_stage stage_0)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)

    ;; initial facts as provided for scenario 1
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_4 object_6)
    (next object_5 object_9)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal (and (next object_10 object_6)))
)