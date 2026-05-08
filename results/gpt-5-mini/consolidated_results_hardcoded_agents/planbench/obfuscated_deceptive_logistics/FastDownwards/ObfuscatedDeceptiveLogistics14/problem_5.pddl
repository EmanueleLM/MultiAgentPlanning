(define (problem ObfuscatedDeceptiveLogistics14-problem)
  (:domain ObfuscatedDeceptiveLogistics14)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
    t0 t1 t2 t3 t4 t5 t6 - time
  )

  (:init
    ;; unary predicates
    (cats object_0)

    (hand object_9)
    (hand object_10)
    (hand object_11)
    (hand object_12)

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

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; next relations (initial positions)
    (next object_0 object_7)
    (next object_10 object_8)
    (next object_11 object_5)
    (next object_12 object_6)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_7)

    ;; time chain and current time
    (succ t0 t1)
    (succ t1 t2)
    (succ t2 t3)
    (succ t3 t4)
    (succ t4 t5)
    (succ t5 t6)
    (now t0)
  )

  (:goal
    (and
      (next object_10 object_6)
      (next object_11 object_7)
      (next object_12 object_7)
      (next object_9 object_6)
    )
  )
)