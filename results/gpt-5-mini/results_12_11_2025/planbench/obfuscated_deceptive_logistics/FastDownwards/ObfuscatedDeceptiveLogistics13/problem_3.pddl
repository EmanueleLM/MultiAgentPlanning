(define (problem ObfuscatedDeceptiveLogistics13-problem1)
  (:domain ObfuscatedDeceptiveLogistics13)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 - stage
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; hand
    (hand object_10)
    (hand object_11)
    (hand object_12)

    ;; next relations (initial statement variant 1)
    (next object_0 object_6)
    (next object_1 object_8)
    (next object_10 object_9)
    (next object_11 object_6)
    (next object_12 object_6)
    (next object_4 object_7)
    (next object_5 object_8)

    ;; sneeze
    (sneeze object_4)
    (sneeze object_5)

    ;; spring
    (spring object_6)
    (spring object_8)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; texture
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; explicit stage progression (one action advances current-stage)
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
    (stage-next stage_11 stage_12)
    (stage-next stage_12 stage_13)
    (stage-next stage_13 stage_14)
    (stage-next stage_14 stage_15)
    (stage-next stage_15 stage_16)
    (stage-next stage_16 stage_17)
    (stage-next stage_17 stage_18)
    (stage-next stage_18 stage_19)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
  ))
)