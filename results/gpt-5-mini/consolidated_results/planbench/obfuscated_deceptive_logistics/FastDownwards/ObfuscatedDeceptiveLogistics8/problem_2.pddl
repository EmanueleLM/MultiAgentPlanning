(define (problem scenario_1)
  (:domain ObfuscatedDeceptiveLogistics8)

  ; Objects: explicit with types obj and stage
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
    stage_1 stage_2 stage_3 stage_4 - stage
  )

  ; Initial facts taken from scenario_1 in the specification.
  ; Assumption (explicit in model): we enforce a linear sequence of stages.
  ; stage_1 is initially available; actions consume the available stage and unlock its successor.
  (:init
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_9)
    (next object_0 object_7)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_8)
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

    ;; Stage ordering chain (explicit)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)

    ;; Start with the first stage available to enforce a linear action sequence.
    (available stage_1)
  )

  ; Goal: target next relations as specified for scenario_1.
  (:goal (and
    (next object_10 object_5)
    (next object_9 object_7)
  ))
)