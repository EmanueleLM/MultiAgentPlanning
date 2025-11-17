(define (problem Logistics24-problem-1)
  (:domain Logistics24)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7
    stage_8 stage_9 stage_10 stage_11 stage_12 - stage
  )

  (:init
    ;; initial global time marker and explicit successor chain (discrete contiguous time)
    (now stage_0)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)
    (succ stage_7 stage_8)
    (succ stage_8 stage_9)
    (succ stage_9 stage_10)
    (succ stage_10 stage_11)
    (succ stage_11 stage_12)

    ;; Initial facts from the provided STATEMENT (first block)
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

    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)

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
    (next object_13 object_9)
  ))
)