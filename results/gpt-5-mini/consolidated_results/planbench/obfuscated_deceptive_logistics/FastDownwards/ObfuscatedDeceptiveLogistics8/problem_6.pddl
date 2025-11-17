(define (problem scenario_1)
  (:domain ObfuscatedDeceptiveLogistics8)

  ; Objects: domain objects and explicit stages enforcing linear progression
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
    stage_1 stage_2 stage_3 stage_4 - stage
  )

  ; Initial facts directly from scenario_1.
  ; Assumption (explicit in init): a contiguous linear schedule is enforced by the stage chain below.
  ; Exactly one stage token is initially available (stage_1). Each action consumes the current
  ; available stage and makes its successor available, preventing simultaneous or out-of-order actions.
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

    ; Linear stage chain to enforce contiguous occupancy (supports up to 3 actions here)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)

    ; Only the first stage token is initially available
    (available stage_1)
  )

  ; Goal: required next relations for scenario_1.
  (:goal (and
    (next object_10 object_5)
    (next object_9 object_7)
  ))
)