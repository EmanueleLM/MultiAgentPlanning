; Problem: multiagent_vases_problem
; Assumptions and notes (explicit, no invented facts):
; - Objects from the two scenarios are kept separate and namespaced:
;     Scenario 1 objects are named object_0_s1 ... object_9_s1
;     Scenario 2 objects are named object_0_s2 ... object_10_s2
; - Only the initial facts explicitly listed in the agent fragments were used.
; - No busy/blocked time windows or temporal constraints were provided; none were encoded.
; - For Scenario 2 the provided facts do not allow derivation of the goal next object_10 object_6
;   without additional facts (see player_B analysis). No such facts were invented here.
; - Agent actions are namespaced: playerA-* correspond to Scenario 1 actions, playerB-* to Scenario 2.
(define (problem multiagent_vases_prob)
  (:domain multiagent_vases)

  (:objects
    ;; Scenario 1 objects (suffixed _s1)
    object_0_s1 object_1_s1 object_2_s1 object_3_s1 object_4_s1 object_5_s1 object_6_s1 object_7_s1 object_8_s1 object_9_s1 - obj
    ;; Scenario 2 objects (suffixed _s2)
    object_0_s2 object_1_s2 object_2_s2 object_3_s2 object_4_s2 object_5_s2 object_6_s2 object_7_s2 object_8_s2 object_9_s2 object_10_s2 - obj
  )

  (:init
    ;-- Scenario 1 initial facts (namespaced)
    (cats object_0_s1)
    (collect object_5_s1 object_1_s1)
    (collect object_6_s1 object_1_s1)
    (collect object_7_s1 object_2_s1)
    (collect object_8_s1 object_2_s1)
    (hand object_9_s1)
    (next object_0_s1 object_5_s1)
    (next object_3_s1 object_5_s1)
    (next object_4_s1 object_8_s1)
    (next object_9_s1 object_6_s1)
    (sneeze object_3_s1)
    (sneeze object_4_s1)
    (spring object_5_s1)
    (spring object_7_s1)
    (stupendous object_1_s1)
    (stupendous object_2_s1)
    (texture object_5_s1)
    (texture object_6_s1)
    (texture object_7_s1)
    (texture object_8_s1)

    ;-- Scenario 2 initial facts (namespaced)
    (cats object_0_s2)
    (cats object_1_s2)
    (collect object_6_s2 object_2_s2)
    (collect object_7_s2 object_2_s2)
    (collect object_8_s2 object_3_s2)
    (collect object_9_s2 object_3_s2)
    (hand object_10_s2)
    (next object_0_s2 object_8_s2)
    (next object_1_s2 object_6_s2)
    (next object_10_s2 object_9_s2)
    (next object_4_s2 object_6_s2)
    (next object_5_s2 object_9_s2)
    (sneeze object_4_s2)
    (sneeze object_5_s2)
    (spring object_6_s2)
    (spring object_8_s2)
    (stupendous object_2_s2)
    (stupendous object_3_s2)
    (texture object_6_s2)
    (texture object_7_s2)
    (texture object_8_s2)
    (texture object_9_s2)
  )

  (:goal (and
    ; Scenario 1 goal
    (next object_9_s1 object_7_s1)
    ; Scenario 2 goal
    (next object_10_s2 object_6_s2)
  ))
)