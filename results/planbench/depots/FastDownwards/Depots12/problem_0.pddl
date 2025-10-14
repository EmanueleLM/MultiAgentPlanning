(define (problem multiobj-combined)
  (:domain multiobj)

  ; Objects merged from agent_a and agent_b analyses
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12
  )

  (:init
    ; ---- Initial facts from agent_a (Initial A) ----
    ; agent_a: cats object_0
    (cats object_0)
    ; agent_a: collect object_5 object_1, collect object_6 object_1, collect object_7 object_2, collect object_8 object_2
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    ; agent_a: hands
    (hand object_10)
    (hand object_11)
    (hand object_9)
    ; agent_a: next facts
    (next object_0 object_5)
    (next object_10 object_5)
    (next object_11 object_5)
    (next object_3 object_6)
    (next object_4 object_7)
    (next object_9 object_8)
    ; agent_a: sneeze, spring, stupendous, texture
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

    ; ---- Initial facts from agent_b (Initial B) ----
    ; agent_b: cats object_1
    (cats object_1)
    ; agent_b: collect facts (note some overlap with agent_a collects)
    (collect object_6 object_2)
    (collect object_7 object_2) ; duplicate with agent_a's collect object_7 object_2 is fine (idempotent)
    (collect object_8 object_3)
    (collect object_9 object_3)
    ; agent_b: hands (object_10 and object_11 already present), additional hand
    (hand object_12)
    ; agent_b: next facts
    (next object_0 object_6)
    (next object_1 object_8)
    (next object_10 object_9)
    (next object_11 object_6)
    (next object_12 object_6)
    (next object_4 object_7) ; already present in agent_a initial facts (idempotent)
    (next object_5 object_8)
    ; agent_b: sneeze, spring, stupendous, texture
    (sneeze object_5)
    (spring object_6)
    (spring object_8)
    (stupendous object_3)
    (texture object_9)
    ; Note: textures 6,7,8 already present from agent_a; texture 9 added here.
  )

  ; Combined goal: conjunction of Goal A and Goal B (the planner will attempt to satisfy all simultaneously)
  ; Goal A: (next object_10 object_8), (next object_11 object_7), (next object_9 object_6)
  ; Goal B: (next object_10 object_7), (next object_11 object_9), (next object_12 object_8)
  (:goal (and
    (next object_10 object_8)
    (next object_11 object_7)
    (next object_9 object_6)
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
  ))
)