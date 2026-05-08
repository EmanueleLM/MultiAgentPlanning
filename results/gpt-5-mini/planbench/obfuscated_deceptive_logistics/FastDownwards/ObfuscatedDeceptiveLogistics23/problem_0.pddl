(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ; Objects with types (consistent with the analyst's candidate lists and initial facts)
  (:objects
    object_0 object_1 - cat
    object_2 object_3 - stupendous
    object_4 object_5 - sneeze
    object_6 - spring
    object_9 - spring
    object_7 object_8 object_10 object_11 - texture
    object_12 object_13 - hand
  )

  ; Initial state: all ground facts known from the analyst output.
  (:init
    ; next facts
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)

    ; collect facts
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ; Note: no vase facts initially (so actions that require vase are initially blocked)
  )

  ; Goal: Achieve a concrete vase relation between a hand and a sneeze as implied by the integrated inputs.
  ; The analyst's facts make clip(object_12,object_5,object_11) applicable immediately, so we use the reachable target:
  (:goal (and
    (vase object_12 object_5)
  ))
)