(define (problem ObfuscatedDeceptiveLogistics12-problem1)
  (:domain ObfuscatedDeceptiveLogistics12)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
    st0 st1 st2 st3 st4 st5 st6 st7 st8 st9 st10 st11 st12 st13 st14 st15 st16 st17 st18 - stage
  )

  (:init
    ;; stage ordering and initial timepoint
    (succ st0 st1) (succ st1 st2) (succ st2 st3) (succ st3 st4) (succ st4 st5)
    (succ st5 st6) (succ st6 st7) (succ st7 st8) (succ st8 st9) (succ st9 st10)
    (succ st10 st11) (succ st11 st12) (succ st12 st13) (succ st13 st14) (succ st14 st15)
    (succ st15 st16) (succ st16 st17) (succ st17 st18)
    (current st0)

    ;; initial facts (scenario 1)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_11)
    (hand object_9)
    (next object_0 object_5)
    (next object_10 object_5)
    (next object_11 object_5)
    (next object_3 object_6)
    (next object_4 object_7)
    (next object_9 object_8)
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
  )

  (:goal (and
    (next object_10 object_8)
    (next object_11 object_7)
    (next object_9 object_6)
  ))
)