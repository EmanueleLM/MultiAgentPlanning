(define (problem obfuscated-deceptive-logistics-problem)
  (:domain obfuscated-deceptive-logistics)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj
  )

  (:init
    ;; Combined initial facts from both statement blocks

    ;; cats
    (cats object_0)
    (cats object_1)

    ;; hand
    (hand object_8)
    (hand object_9)

    ;; texture
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; sneeze
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring
    (spring object_5)
    (spring object_6)
    (spring object_7)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_7 object_3)
    (collect object_8 object_2)

    ;; next relations (union of both statements)
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (next object_9 object_7)

    (next object_0 object_7)
    (next object_3 object_5)
    (next object_4 object_7)

    ;; Note: duplicates intentionally merged above
  )

  ;; Global goal: include both scenario goals so the problem verifies feasibility of the combined requirements.
  ;; (The provided proposed_solution achieves the first scenario's goals; the second scenario's goal is unreachable.)
  (:goal (and
    (next object_8 object_7)   ;; Goal from first statement block (already initially true)
    (next object_9 object_6)   ;; Goal from first statement block (achieved by the proposed 4-step plan)
    (next object_9 object_8)   ;; Goal from second statement block (unreachable given the initial facts and actions)
  ))
)