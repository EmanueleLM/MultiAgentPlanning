(define (problem orchestrator-problem-variantA)
  (:domain orchestrator)
  ;; Using statement/goal variant A (as requested: this problem encodes Variant A)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; Facts chosen from the provided use-case snippets consistent with the paltry example:
    (hand object_0)
    (cats object_1)
    (texture object_2)
    (vase object_0 object_1)
    (next object_1 object_2)

    ;; Additional initial facts to enable other actions (kept minimal and explicit)
    (collect object_3 object_4)
    (hand object_3)
    (texture object_4)

    ;; Note: any busy/blocked/unavailable intervals from the original statements would be
    ;; represented here as absence of relevant hand/next/collect/etc. facts. No temporal fluents
    ;; are used (classical STRIPS encoding).
  )

  (:goal (and
    ;; Variant A goals (explicit): produce next(object_0, object_2) and spring(object_4)
    (next object_0 object_2)
    (spring object_4)
  ))
)