(define (problem objects-problem)
  (:domain objects-actions)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj

    ;; Explicit sequence of stages to enforce contiguous, non-oscillating execution.
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 - stage
  )

  (:init
    ;; Initial stage and the explicit linear stage successor chain.
    (current-stage stage_0)
    (stage-next stage_0 stage_1)
    (stage-next stage_1 stage_2)
    (stage-next stage_2 stage_3)
    (stage-next stage_3 stage_4)
    (stage-next stage_4 stage_5)
    (stage-next stage_5 stage_6)
    (stage-next stage_6 stage_7)
    (stage-next stage_7 stage_8)
    (stage-next stage_8 stage_9)
    (stage-next stage_9 stage_10)
    (stage-next stage_10 stage_11)

    ;; Initial facts as specified
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (hand object_11)
    (hand object_12)
    (hand object_13)
    (hand object_14)

    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_5)
    (next object_13 object_7)
    (next object_14 object_9)
    (next object_3 object_6)
    (next object_4 object_9)

    (sneeze object_3)
    (sneeze object_4)

    (spring object_5)
    (spring object_8)

    (stupendous object_1)
    (stupendous object_2)

    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal (and
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_5)
    (next object_14 object_7)
  ))
)