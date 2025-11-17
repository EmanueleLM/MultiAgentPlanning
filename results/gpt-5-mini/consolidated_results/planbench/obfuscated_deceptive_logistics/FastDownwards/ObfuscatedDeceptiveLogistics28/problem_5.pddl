(define (problem obfuscated_deceptive_logistics_instance1)
  (:domain obfuscated_deceptive_logistics)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 - stage
  )

  (:init
    ;; explicit successor chain to allow a bounded sequence of actions
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16)
    (succ s16 s17)

    ;; initial stage: actions must be executed starting at s0 and each action advances to the next stage
    (stage_reached s0)

    ;; initial facts (first instance)
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
    (hand object_14)

    (next object_0 object_6)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_6)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

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
    (next object_13 object_10)
    (next object_14 object_9)
  ))
)