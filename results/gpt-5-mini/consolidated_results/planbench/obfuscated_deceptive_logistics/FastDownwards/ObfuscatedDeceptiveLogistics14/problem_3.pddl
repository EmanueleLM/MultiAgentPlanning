(define (problem ObfuscatedDeceptiveLogistics14-problem)
  (:domain ObfuscatedDeceptiveLogistics14)

  (:objects
    object_0 - cat
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_5 object_6 object_7 object_8 - obj
    object_9 object_10 object_11 object_12 - hand

    t0 t1 t2 t3 t4 - time
  )

  (:init
    ;; relational facts required to enable actions and reach the goal
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (next object_0 object_7)
    (next object_10 object_8)
    (next object_11 object_5)
    (next object_12 object_6)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_7)

    ;; properties left as predicates (overlaps prevent encoding all as types)
    (spring object_5)
    (spring object_7)

    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; compact time chain sufficient for sequential actions
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4)
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