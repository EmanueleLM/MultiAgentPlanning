(define (problem Logistics25-problem-0)
  (:domain Logistics25)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - object
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; Provided initial facts
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
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)
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

    ;; Stage definitions and successor chain to enforce ordered execution
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6) (stage s7)
    (stage s8) (stage s9) (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15)

    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; Start at stage s0
    (current s0)
  )

  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)