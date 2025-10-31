(define (problem MysteryBlocksworld23_problem_A)
  (:domain MysteryBlocksworld23)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Notes / assumptions:
  ; - This problem encodes the observer_A fragment (initial facts and goal)
  ;   from the human specification. The proposed_solution above is a valid
  ;   plan for this problem and achieves the stated goal (next object_11 object_7
  ;   and next object_12 object_8).
  ; - Observer_B's reported fragment (different initial facts and goals) was
  ;   integrated in the domain (observer_B_* actions are present), but the
  ;   initial state here intentionally corresponds to observer_A's reported
  ;   situation so the supplied plan is directly executable and verifiable.
  ; - Achieving the combined goals from both observers' distinct initial
  ;   fragments (the union) can be impossible in general because some actions
  ;   require predicates (e.g., sneeze on a specific object) that only appear
  ;   in one fragment but not the other. If desired, a separate problem with
  ;   the merged initial state can be constructed; that is not required to
  ;   validate the provided observer_A plan.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; observer_A initial facts (from the first STATEMENT in the human spec)
    (cats object_0)

    ;; collect facts
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; hands
    (hand object_11)
    (hand object_12)

    ;; next relations
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)

    ;; sneeze predicates
    (sneeze object_3)
    (sneeze object_4)

    ;; spring predicates
    (spring object_5)
    (spring object_8)

    ;; stupendous predicates
    (stupendous object_1)
    (stupendous object_2)

    ;; texture predicates
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal (and
    (next object_11 object_7)
    (next object_12 object_8)
  ))
)