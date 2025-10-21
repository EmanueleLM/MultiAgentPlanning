(define (problem orchestrator-problem-A)
  (:domain orchestrator)
  ; Variant encoded: Variant A (Initial facts and Goal facts correspond to Variant A from the librarian input)

  :objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - object

  :init
    ;; Variant A initial facts
    (hand object_0)
    (cats object_1)
    (texture object_2)
    (vase object_0 object_1)
    (next object_1 object_2)
    (next object_2 object_3)
    (next object_3 object_4)
    (next object_4 object_5)
    (next object_5 object_14)
    (sneeze object_5)
    (stupendous object_6)
    (collect object_7)
    (spring object_8)
    (vase object_9 object_10)
    (hand object_11)
    (cats object_12)
    (texture object_13)
    (collect object_14)

  :goal (and
           (next object_0 object_14)
           (collect object_7)
           (stupendous object_6)
         )
)