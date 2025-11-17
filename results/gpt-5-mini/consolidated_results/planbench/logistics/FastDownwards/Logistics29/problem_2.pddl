(define (problem orchestrated-problem)
  (:domain orchestrated)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11
    object_12 object_13 object_14 - Obj

    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19
    stage_20 - Stage
  )

  (:init
    ;; stages and linear successor relation
    (stage stage_0) (stage stage_1) (stage stage_2) (stage stage_3) (stage stage_4)
    (stage stage_5) (stage stage_6) (stage stage_7) (stage stage_8) (stage stage_9)
    (stage stage_10) (stage stage_11) (stage stage_12) (stage stage_13) (stage stage_14)
    (stage stage_15) (stage stage_16) (stage stage_17) (stage stage_18) (stage stage_19)
    (stage stage_20)

    (succ stage_0 stage_1) (succ stage_1 stage_2) (succ stage_2 stage_3) (succ stage_3 stage_4)
    (succ stage_4 stage_5) (succ stage_5 stage_6) (succ stage_6 stage_7) (succ stage_7 stage_8)
    (succ stage_8 stage_9) (succ stage_9 stage_10) (succ stage_10 stage_11) (succ stage_11 stage_12)
    (succ stage_12 stage_13) (succ stage_13 stage_14) (succ stage_14 stage_15) (succ stage_15 stage_16)
    (succ stage_16 stage_17) (succ stage_17 stage_18) (succ stage_18 stage_19) (succ stage_19 stage_20)

    (current stage_0)

    ;; unary predicates (from human initial statement #1)
    (cats object_0)

    (hand object_11)
    (hand object_12)
    (hand object_13)
    (hand object_14)

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

    ;; collect relations
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; initial next relations
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_5)
    (next object_13 object_7)
    (next object_14 object_9)
    (next object_3 object_6)
    (next object_4 object_9)
  )

  (:goal (and
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_5)
    (next object_14 object_7)
  ))
)