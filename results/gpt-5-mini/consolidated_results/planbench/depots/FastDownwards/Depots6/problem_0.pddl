; =========================================================================
; Problem: Orchestrated integration of two plan fragments (Scenario 1 and 2)
; Assumptions and notes:
; - The initial facts included below are exactly those facts explicitly
;   referenced as "verified (initial)" in the two provided analyzer fragments.
;   No additional world facts have been invented beyond those mentions.
; - Objects are distinct and are named object_0 ... object_10.
; - No initial (vase ...) facts were stated in the fragments; vases are created
;   only by actions in the plans.
; - Both scenario goals are required simultaneously in this single problem:
;   (next object_9 object_7)  AND  (next object_10 object_6).
; - Actions are namespaced by agent: playerA-* and playerB-*. The domain
;   contains both agents' action schemas (identical pre/effects but distinct
;   names) so both plan fragments can be expressed and interleaved if needed.
; =========================================================================

(define (problem orchestrated-problem)
  (:domain orchestrator-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
  )

  (:init
    ;; From Scenario 1 (player_A) initial facts (as reported)
    (sneeze object_3)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (stupendous object_1)
    (next object_3 object_5)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (hand object_9)
    (next object_9 object_6)
    (cats object_0)
    (next object_0 object_5)
    (spring object_5)
    (spring object_7)

    ;; From Scenario 2 (player_B) initial facts (as reported)
    (hand object_10)
    (sneeze object_5)
    (texture object_9)
    (next object_5 object_9)
    (next object_10 object_9)
    (texture object_8)
    (stupendous object_3)
    (collect object_9 object_3)
    (collect object_8 object_3)
    (cats object_1)
    (spring object_6)
    (spring object_8)
    (next object_1 object_6)
    (texture object_6)

    ;; Note: texture/object membership includes all textures referenced.
    ;; No initial (vase ...) facts are asserted.
  )

  (:goal (and
    (next object_9 object_7)
    (next object_10 object_6)
  ))
)