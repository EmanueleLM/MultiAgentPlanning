(define (problem episode_A_ObfuscatedDeceptiveLogistics25)
  (:domain ObfuscatedDeceptiveLogistics25)
  (:objects
    object_0 - cat
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_11 object_12 object_13 - hand
    object_5 object_6 object_7 object_8 object_9 object_10 - obj

    phase_0 phase_1 phase_2 phase_3 phase_4 phase_5 phase_6 phase_7 phase_8 phase_9
    phase_10 phase_11 phase_12 phase_13 phase_14 phase_15 phase_16 phase_17 - phase
  )

  (:init
    ;; unary facts
    (cats object_0)
    ;; collect relations
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (initial)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)

    ;; springs
    (spring object_5)
    (spring object_8)

    ;; textures
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; stupendous markers
    (stupendous object_1)
    (stupendous object_2)

    ;; sneeze and hand typing are represented via the object types in :objects

    ;; phase chain and start phase
    (at-phase phase_0)
    (phase-succ phase_0 phase_1)
    (phase-succ phase_1 phase_2)
    (phase-succ phase_2 phase_3)
    (phase-succ phase_3 phase_4)
    (phase-succ phase_4 phase_5)
    (phase-succ phase_5 phase_6)
    (phase-succ phase_6 phase_7)
    (phase-succ phase_7 phase_8)
    (phase-succ phase_8 phase_9)
    (phase-succ phase_9 phase_10)
    (phase-succ phase_10 phase_11)
    (phase-succ phase_11 phase_12)
    (phase-succ phase_12 phase_13)
    (phase-succ phase_13 phase_14)
    (phase-succ phase_14 phase_15)
    (phase-succ phase_15 phase_16)
    (phase-succ phase_16 phase_17)
  )

  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)