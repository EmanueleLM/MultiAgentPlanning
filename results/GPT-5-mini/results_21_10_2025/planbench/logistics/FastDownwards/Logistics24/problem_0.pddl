;; Problem file 1: Scenario 1
(define (problem scenario1)
  (:domain orchestrator)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 - object
  )
  (:init
    ;; unary predicates
    (cats object_0)
    (cats object_1)

    (hand object_12)
    (hand object_13)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_10)
    (texture object_11)
    (texture object_6)  ;; object_6 is both spring and texture in the scenario
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; collect relations (collect(texture, stupendous))
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; next relations
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)
  )
  (:goal (and
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem file 2: Scenario 2
;; Note: The analyst asked to prefer scenario 2 when choosing a single scenario.
;;       Both scenario 1 and scenario 2 are included here as separate problem defs.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem scenario2)
  (:domain orchestrator)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 - object
  )
  (:init
    ;; unary predicates
    (cats object_0) ;; only object_0 is a cat in scenario 2

    (hand object_11)
    (hand object_12)
    (hand object_13)

    (sneeze object_3)
    (sneeze object_4)

    (spring object_5)
    (spring object_8)

    (stupendous object_1)
    (stupendous object_2)

    (texture object_10)
    (texture object_5) ;; object_5 is both spring and texture here
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; collect relations
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)
  )
  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)