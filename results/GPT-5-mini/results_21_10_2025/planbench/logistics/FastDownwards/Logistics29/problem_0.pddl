(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11
    object_12 object_13 object_14 - obj
  )

  ;;; Notes / reported grounded plan fragments (reported but NOT converted to PDDL actions):
  ;;; Plan 1 (for Variant A): 
  ;;; 1. paltry object_12 object_3
  ;;; 2. sip object_13
  ;;; 3. clip object_8 object_9
  ;;; 4. memory object_11 object_8
  ;;; 5. tightfisted object_11 object_9
  ;;;
  ;;; Plan 2 (for Variant B):
  ;;; 1. wretched object_14 object_5
  ;;; 2. paltry object_12 object_1
  ;;; 3. clip object_11 object_10
  ;;; 4. memory object_13 object_2
  ;;; 5. tightfisted object_11 object_10

  ;; Initial state: union of Variant A and Variant B (both variants reported as facts).
  ;; Note: the inspectors reported a unary "vase object_6" in the initial facts while actions use vase as a binary predicate.
  ;; To keep predicate usage consistent with action schemas, the initial fact is represented as vase(object_6,object_6).
  (:init
    (cats object_0)
    (texture object_1)
    (texture object_2)
    (texture object_3)
    (texture object_4)
    (texture object_5)

    ;; reconciled vase initial fact (reported singly for object_6)
    (vase object_6 object_6)

    (stupendous object_2)
    (stupendous object_7)

    (collect object_1 object_2)
    (collect object_3 object_4)

    ;; Variant A had collect object_8 object_9
    (collect object_8 object_9)
    ;; Variant B had collect object_9 object_8 (different from A); include both to report both variants
    (collect object_9 object_8)

    (hand object_11)
    (hand object_12)
    (hand object_13)
    (hand object_14)

    (next object_1 object_2)
    (next object_2 object_3)
    (next object_3 object_4)
    (next object_4 object_5)
    (next object_11 object_8)

    (sneeze object_5)
    (spring object_10)
  )

  ;; Goals: both reported goal sets (treated as strict constraints).
  ;; Goal set 1 (Variant A): (next object_11 object_9)
  ;; Goal set 2 (Variant B): (next object_11 object_10)
  ;; Both are required here (conjunction).
  (:goal (and
    (next object_11 object_9)
    (next object_11 object_10)
  ))
)