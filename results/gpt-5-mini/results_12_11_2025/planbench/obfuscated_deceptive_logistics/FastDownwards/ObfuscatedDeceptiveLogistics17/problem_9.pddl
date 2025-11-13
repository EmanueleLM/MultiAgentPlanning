(define (problem obfuscated-deceptive-logistics17-problem)
  (:domain obfuscated-deceptive-logistics17)

  (:objects
    ;; drop unused object_0 to reduce init clutter; keep objects that appear in plan/goal
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; essential unary facts only (kept those actually referenced by the grounded plan)
    (cats object_1)

    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    ;; textures used by the plan
    (texture object_6)
    (texture object_8)
    (texture object_9)

    ;; collect relations required by wretched instances in the plan
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; only the next relations necessary to bootstrap the given plan fragment and reach goals
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_11 object_8)
    (next object_12 object_9)
    (next object_13 object_6)
    (next object_4 object_7)
    (next object_5 object_9)
  )

  (:goal (and
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)