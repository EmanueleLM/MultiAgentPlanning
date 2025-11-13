(define (problem obfuscated-deceptive-logistics17-problem)
  (:domain obfuscated-deceptive-logistics17)

  (:objects
    ;; keep only objects that appear in the plan/goal
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; Minimal necessary unary facts referenced by actions in the provided plan
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

    ;; textures actually used by plan instances
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; collect relations required by the wretched actions in the plan
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; only the next relations required to bootstrap the grounded plan fragment and reach the goal
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