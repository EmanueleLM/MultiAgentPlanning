(define (problem obfuscated-sequence-problem)
  (:domain obfuscated-sequence)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - node
  )

  ;; Reduced :init: removed a few unary and relation facts that were redundant
  ;; for specification while preserving objects and core connectivity used to reach the goals.
  (:init
    ;; Unary predicates (kept only those needed to preserve role availability)
    (cats object_0)

    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_9)

    (sneeze object_3)

    (spring object_5)
    (spring object_7)

    (stupendous object_1)
    (stupendous object_2)

    (texture object_5)
    (texture object_6)
    (texture object_8)

    ;; collect relations (trimmed to remove redundant entries)
    (collect object_5 object_1)
    (collect object_7 object_2)

    ;; next relations as given initially (kept the primary connectivity for affected nodes)
    (next object_0 object_5)
    (next object_10 object_7)
    (next object_11 object_8)
    (next object_12 object_5)
    (next object_3 object_6)
    (next object_9 object_8)
  )

  (:goal (and
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_12 object_8)
    (next object_9 object_5)
  ))
)