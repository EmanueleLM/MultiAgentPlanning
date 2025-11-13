(define (problem ObfuscatedDeceptiveLogistics10-StatementA)
  (:domain ObfuscatedDeceptiveLogistics10)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    t0 t1 t2 t3 t4 t5 t6 t7 - time
  )

  (:init
    ;; original initial facts (Statement A)
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_10)
    (hand object_11)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_4 object_6)
    (next object_5 object_8)
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

    ;; time-slot ordering infrastructure to enforce ordered action execution
    ;; t0 is a sentinel "already used" so first real slot t1 can be consumed
    (used t0)
    (free t1)
    (free t2)
    (free t3)
    (free t4)
    (free t5)
    (free t6)
    (free t7)

    ;; predecessor links: t0 -> t1 -> t2 -> ... -> t7
    (prev t0 t1)
    (prev t1 t2)
    (prev t2 t3)
    (prev t3 t4)
    (prev t4 t5)
    (prev t5 t6)
    (prev t6 t7)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)