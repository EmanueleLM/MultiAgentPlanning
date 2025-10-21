; ===============================================================
; Problem instance: Scenario 1 (derived from the human input)
; Notes:
; - This problem encodes Scenario 1 initial facts and the Scenario 1 goal.
; - The domain file implements the exact public action schemas, so the
;   verified grounded action sequence in <proposed_solution> is a valid plan
;   for this problem instance.
; - Objects: object_0 .. object_11 (12 objects, matching the environment spec).
; ===============================================================

(define (problem depots11-scenario1)
  (:domain depots11)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  (:init
    ;; Scenario 1 initial facts (exactly as provided)
    (cats object_0)

    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (hand object_10)
    (hand object_11)
    (hand object_9)

    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)

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
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_9 object_7)
  ))
)