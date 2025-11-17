(define (problem reassign-next-problem)
  (:domain reassign-next)

  ;; Objects: hands and targets are all objects of type obj; explicit step tokens present
  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
    step1 step2 step3 step4 - step
  )

  (:init
    ;; Hand declarations (every source of a `next` relation is declared a hand)
    (hand object_1)
    (hand object_5)
    (hand object_12)
    (hand object_13)
    (hand object_14)

    ;; Initial next links (given)
    (next object_1 object_6)
    (next object_5 object_10)
    (next object_12 object_11)
    (next object_14 object_8)
    (next object_13 object_8)

    ;; Object properties (given)
    (texture object_6)
    (texture object_11)
    (texture object_10)
    (spring object_6)

    ;; Sequencing / ordering tokens to enforce the operator's specified linear plan:
    (at-step step1)
    (step-successor step1 step2)
    (step-successor step2 step3)
    (step-successor step3 step4)

    ;; Authorize exactly one hand per step so the three moves occur in the intended order:
    ;; step1 -> move_next object_12 object_11 object_6
    ;; step2 -> move_next object_14 object_8 object_11
    ;; step3 -> move_next object_13 object_8 object_10
    (allowed-step-hand step1 object_12)
    (allowed-step-hand step2 object_14)
    (allowed-step-hand step3 object_13)
  )

  ;; Final goal: the plan's intended reassignments have occurred, and the sequencer reached step4
  (:goal (and
    (next object_12 object_6)
    (next object_14 object_11)
    (next object_13 object_10)
    (at-step step4)
  ))

  ;;; Assumptions encoded in this problem (explicit and minimal):
  ;;; - Actions are instantaneous (classical STRIPS); no durative actions are used.
  ;;; - There is no global uniqueness constraint on targets: multiple hands may point to the same target
  ;;;   (the original inputs flagged this as a possible constraint but it was not provided as a definite rule).
  ;;; - The action template for move_next requires: hand(h), next(h,old), texture(new), and that the action is
  ;;;   executed at the authorized step. No other hidden preconditions (collect/stupendous/etc.) are assumed.
  ;;; - The step/allowed-step-hand machinery enforces the operator's explicit ordering: the three reassignment
  ;;;   actions must occur in the given sequence (object_12 first, then object_14, then object_13).
)