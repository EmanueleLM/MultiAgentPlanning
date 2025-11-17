(define (problem episode_A_ObfuscatedDeceptiveLogistics25)
  (:domain ObfuscatedDeceptiveLogistics25)
  (:objects
    ;; typed objects for static unary roles (reduce init by using typing)
    object_0 - cat
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_11 object_12 object_13 - hand

    ;; remaining objects (may hold texture/spring/collect/next relations)
    object_5 object_6 object_7 object_8 object_9 object_10 - obj
  )

  (:init
    ;; collect facts required by the plan (only the necessary pairs)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; initial next relations used by the plan
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)

    ;; spring facts needed for memory actions
    (spring object_5)
    (spring object_8)

    ;; texture facts needed by various actions (only those actually used)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)