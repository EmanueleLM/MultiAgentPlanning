(define (problem obfuscated-deceptive-logistics-prob)
  (:domain obfuscated-deceptive-logistics)

  (:objects
    ;; objects from object_0 through object_13
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - object

    ;; discrete stages (provide a contiguous chain sufficient for sequential actions)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 - stage
  )

  (:init
    ;; initial unary predicates (properties)
    (cats object_0)
    (hand object_11)
    (hand object_12)
    (hand object_13)
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

    ;; collect relations from the initial state
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (initial adjacency/order)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)

    ;; stage chain (explicit successor relations)
    (stage-successor stage_0 stage_1)
    (stage-successor stage_1 stage_2)
    (stage-successor stage_2 stage_3)
    (stage-successor stage_3 stage_4)
    (stage-successor stage_4 stage_5)
    (stage-successor stage_5 stage_6)
    (stage-successor stage_6 stage_7)
    (stage-successor stage_7 stage_8)
    (stage-successor stage_8 stage_9)
    (stage-successor stage_9 stage_10)
    (stage-successor stage_10 stage_11)
    (stage-successor stage_11 stage_12)
    (stage-successor stage_12 stage_13)
    (stage-successor stage_13 stage_14)
    (stage-successor stage_14 stage_15)
    (stage-successor stage_15 stage_16)
    (stage-successor stage_16 stage_17)
    (stage-successor stage_17 stage_18)

    ;; initial current stage
    (current stage_0)
  )

  (:goal (and
           (next object_11 object_8)
           (next object_12 object_8)
           (next object_13 object_10)
         )
  )
)