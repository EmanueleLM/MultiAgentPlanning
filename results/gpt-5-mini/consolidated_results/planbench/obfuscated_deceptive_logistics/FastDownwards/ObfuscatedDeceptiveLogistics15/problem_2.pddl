(define (problem scenarioA)
  (:domain ObfuscatedDeceptiveLogistics15)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 stage_20 stage_21 stage_22 - stage
  )
  (:init
    ;; explicit stage chain for contiguous single-action progression
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)
    (succ stage_7 stage_8)
    (succ stage_8 stage_9)
    (succ stage_9 stage_10)
    (succ stage_10 stage_11)
    (succ stage_11 stage_12)
    (succ stage_12 stage_13)
    (succ stage_13 stage_14)
    (succ stage_14 stage_15)
    (succ stage_15 stage_16)
    (succ stage_16 stage_17)
    (succ stage_17 stage_18)
    (succ stage_18 stage_19)
    (succ stage_19 stage_20)
    (succ stage_20 stage_21)
    (succ stage_21 stage_22)

    ;; start at stage_0
    (current stage_0)

    ;; cats
    (cats object_0)

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; hands
    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_9)

    ;; next relations (initial)
    (next object_0 object_7)
    (next object_10 object_8)
    (next object_11 object_5)
    (next object_12 object_6)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_7)

    ;; sneezes
    (sneeze object_3)
    (sneeze object_4)

    ;; springs
    (spring object_5)
    (spring object_7)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)

    ;; textures
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_11 object_7)
    (next object_12 object_7)
    (next object_9 object_6)
  ))
)