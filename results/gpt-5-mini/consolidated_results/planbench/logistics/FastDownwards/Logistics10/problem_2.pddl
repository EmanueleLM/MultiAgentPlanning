(define (problem logistics10-problem1)
  (:domain logistics10)
  (:objects
    object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
  )

  ;; Minimal initial facts required to support the reachable plan that achieves the goal.
  ;; Unused objects and redundant facts were removed.
  (:init
    ;; hands (only the agents actually used)
    (hand object_10)
    (hand object_11)

    ;; sneezers used by the plan
    (sneeze object_4)
    (sneeze object_5)

    ;; textures required by actions in the plan
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; stupendous markers needed by wretched actions
    (stupendous object_2)
    (stupendous object_3)

    ;; collect relations required by wretched actions
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; initial next relations necessary to start the plan transitions
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_4 object_6)
    (next object_5 object_8)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)