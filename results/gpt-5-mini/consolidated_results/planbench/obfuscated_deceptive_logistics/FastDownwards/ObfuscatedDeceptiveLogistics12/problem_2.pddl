(define (problem obfuscated-manipulation-problem1)
  (:domain obfuscated-manipulation)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
    st0 st1 st2 st3 st4 st5 st6 st7 st8 st9 st10 st11 st12 st13 st14 st15 st16 st17 st18 st19 - stage
  )

  (:init
    ;; explicit stages and successor chain (discrete time windows)
    (stage st0) (stage st1) (stage st2) (stage st3) (stage st4) (stage st5) (stage st6) (stage st7) (stage st8) (stage st9)
    (stage st10) (stage st11) (stage st12) (stage st13) (stage st14) (stage st15) (stage st16) (stage st17) (stage st18) (stage st19)
    (succ st0 st1) (succ st1 st2) (succ st2 st3) (succ st3 st4) (succ st4 st5) (succ st5 st6) (succ st6 st7) (succ st7 st8) (succ st8 st9)
    (succ st9 st10) (succ st10 st11) (succ st11 st12) (succ st12 st13) (succ st13 st14) (succ st14 st15) (succ st15 st16) (succ st16 st17) (succ st17 st18) (succ st18 st19)
    ;; start at the initial stage
    (current st0)

    ;; From scenario 1 initial facts (canonicalized, duplicates removed)
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