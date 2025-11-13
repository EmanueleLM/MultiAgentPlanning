(define (problem odl29-instance)
  (:domain ObfuscatedDeceptiveLogistics29)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14
    time_0 time_1 time_2 time_3 time_4 time_5 time_6 time_7 time_8 time_9 time_10 time_11 time_12 time_13 time_14 time_15 time_16 time_17 time_18 time_19 time_20
  )
  (:init
    ;; time chain (discrete stages). The plan provided takes up to 20 steps; provide contiguous successors.
    (at time_0)
    (succ time_0 time_1) (succ time_1 time_2) (succ time_2 time_3) (succ time_3 time_4)
    (succ time_4 time_5) (succ time_5 time_6) (succ time_6 time_7) (succ time_7 time_8)
    (succ time_8 time_9) (succ time_9 time_10) (succ time_10 time_11) (succ time_11 time_12)
    (succ time_12 time_13) (succ time_13 time_14) (succ time_14 time_15) (succ time_15 time_16)
    (succ time_16 time_17) (succ time_17 time_18) (succ time_18 time_19) (succ time_19 time_20)

    ;; Initial unary predicates and binary relations (from the first statement block)
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