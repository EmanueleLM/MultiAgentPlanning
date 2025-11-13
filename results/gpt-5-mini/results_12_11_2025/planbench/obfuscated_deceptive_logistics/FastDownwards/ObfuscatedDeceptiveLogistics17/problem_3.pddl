(define (problem obfuscated-deceptive-logistics17-problem)
  (:domain obfuscated-deceptive-logistics17)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
    time_0 time_1 time_2 time_3 time_4 time_5 time_6 time_7 time_8 time_9 time_10 time_11 time_12 time_13 time_14 time_15 time_16 time_17 time_18 time_19 time_20 time_21 time_22 - time
  )

  (:init
    (cats object_0)
    (cats object_1)

    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)

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

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (next object_0 object_6)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_11 object_8)
    (next object_12 object_9)
    (next object_13 object_6)
    (next object_4 object_7)
    (next object_5 object_9)

    (time-point time_0) (time-point time_1) (time-point time_2) (time-point time_3) (time-point time_4)
    (time-point time_5) (time-point time_6) (time-point time_7) (time-point time_8) (time-point time_9)
    (time-point time_10) (time-point time_11) (time-point time_12) (time-point time_13) (time-point time_14)
    (time-point time_15) (time-point time_16) (time-point time_17) (time-point time_18) (time-point time_19)
    (time-point time_20) (time-point time_21) (time-point time_22)

    (succ time_0 time_1) (succ time_1 time_2) (succ time_2 time_3) (succ time_3 time_4) (succ time_4 time_5)
    (succ time_5 time_6) (succ time_6 time_7) (succ time_7 time_8) (succ time_8 time_9) (succ time_9 time_10)
    (succ time_10 time_11) (succ time_11 time_12) (succ time_12 time_13) (succ time_13 time_14) (succ time_14 time_15)
    (succ time_15 time_16) (succ time_16 time_17) (succ time_17 time_18) (succ time_18 time_19) (succ time_19 time_20)
    (succ time_20 time_21) (succ time_21 time_22)

    (current time_0)
  )

  (:goal (and
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)