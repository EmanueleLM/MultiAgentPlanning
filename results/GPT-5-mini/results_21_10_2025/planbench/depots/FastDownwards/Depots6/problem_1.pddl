; =========================================================================
; Problem: Orchestrated integration of two scenarios (Scenario 1 and Scenario 2)
; Assumptions and notes:
; - Objects are object_0 .. object_10 (as named in the scenarios).
; - Initial facts are exactly those explicitly provided in the two scenarios.
; - No extra (vase ...) facts are assumed initially; vases can be produced by actions.
; - The two goals are required simultaneously in this single problem:
;     (next object_9 object_7)  AND  (next object_10 object_6)
; - Analysis summary:
;   * Scenario 1: the provided plan is feasible and achieves next object_9 object_7.
;   * Scenario 2: given the stated initial facts, next object_10 object_6 is not reachable.
;     Missing enabling facts include (for example) a suitable (next ?Y object_6) that can be
;     used together with a produced vase (vase object_10 ?Y) or a shared collect link
;     allowing a wretched transition. These missing facts are NOT invented here.
; =========================================================================

(define (problem orchestrated-problem)
  (:domain orchestrator-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
  )

  (:init
    ;; ---------- Scenario 1 initial facts (player_A) ----------
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_9)
    (next object_0 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_6)
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

    ;; ---------- Scenario 2 initial facts (player_B) ----------
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_10)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_4 object_6)
    (next object_5 object_9)
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
  )

  (:goal (and
    (next object_9 object_7)
    (next object_10 object_6)
  ))
)