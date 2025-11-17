(define (problem odl29-instance)
  (:domain ObfuscatedDeceptiveLogistics29)
  (:objects
    ;; Typed objects reduce the number of unary facts required in :init
    object_11 object_12 object_13 object_14 - hand_t
    object_0 - cats_t
    object_3 object_4 - sneeze_t
    object_1 object_2 - stupendous_t

    object_5 object_6 object_7 object_8 object_9 object_10 - obj

    time_0 time_1 time_2 time_3 time_4 time_5 time_6 time_7 time_8 time_9 time_10 time_11 time_12 time_13 time_14 time_15 time_16 time_17 time_18 time_19 time_20 - time
  )
  (:init
    ;; time marker and minimal successor chain (length matches plan horizon)
    (at time_0)
    (succ time_0 time_1) (succ time_1 time_2) (succ time_2 time_3) (succ time_3 time_4)
    (succ time_4 time_5) (succ time_5 time_6) (succ time_6 time_7) (succ time_7 time_8)
    (succ time_8 time_9) (succ time_9 time_10) (succ time_10 time_11) (succ time_11 time_12)
    (succ time_12 time_13) (succ time_13 time_14) (succ time_14 time_15) (succ time_15 time_16)
    (succ time_16 time_17) (succ time_17 time_18) (succ time_18 time_19) (succ time_19 time_20)

    ;; Binary relations and multi-role facts retained as needed
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; Ordering facts needed to bootstrap the plan
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_5)
    (next object_13 object_7)
    (next object_14 object_9)
    (next object_3 object_6)
    (next object_4 object_9)

    ;; Multi-role unary facts (cannot be expressed as disjoint types due to overlaps)
    (spring object_5)
    (spring object_8)

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