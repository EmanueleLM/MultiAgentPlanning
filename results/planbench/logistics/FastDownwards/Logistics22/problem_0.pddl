(define (problem scenario-1)
  (:domain multiagent-usecase)

  ;;; ASSUMPTIONS / NOTES
  ;;; - The original observer output with the exact initial STATEMENT block for scenario 1 was not provided.
  ;;; - To produce an executable PDDL problem we assume the following initial ground facts (explicitly stated below).
  ;;; - These assumptions were chosen so goals are reachable using the normalized action schemas.
  ;;; - If you have the original observer facts, replace the initial state below with those ground predicates.
  ;;; Assumed objects: object_0 .. object_12
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
  )

  (:init
    ;; assumed initial facts for scenario 1
    (hand object_0)
    (cats object_1)
    (texture object_2)
    (vase object_3)
    (next object_4 object_5)
    (sneeze object_5)
    (collect object_6)
    (spring object_7)
    (stupendous object_8)
  )

  ;; GOAL for scenario 1 (assumed; replace with provided goal if different)
  ;; Goal: achieve (collect object_1) and (stupendous object_4)
  (:goal (and
    (collect object_1)
    (stupendous object_4)
  ))
)