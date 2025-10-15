; Problem: Orchestration instance created by integrator.
; Assumptions (conservative):
; - The analyst inputs (analysis_alpha, analysis_beta) were not provided here; to remain conservative we choose an explicit initial condition set below.
; - We treat "can_collect" as the explicit positive permission to collect (to avoid negated preconditions).
; - The final goal chosen is: agent alice must have collected a stupendous vase and remember it. (This encodes the typical integrated objective derived from the analysts' goals.)
; - No other implicit availability or time windows are assumed.
(define (problem orchestrate-problem)
  (:domain orchestrated)

  (:objects
    alice bob
    vase1 cup1
    loc1 loc2
    cat1
  )

  (:init
    ;; locations
    (at alice loc1)
    (at bob loc2)

    ;; objects and positions
    (at vase1 loc1)
    (at cup1 loc2)
    (vase vase1)

    ;; attributes
    (texture cup1 liquid)

    ;; environment relations
    (next loc1 loc2)
    (cats cat1)
    (spring)

    ;; availability and permissions
    (available vase1)
    (can_collect alice)
    ;; bob initially is not allowed to collect in this conservative setup
    ;; (can_collect bob)  ; not asserted, so bob cannot collect unless action tightfisted is reversed (it cannot)

    ;; Note: vase1 is initially not stupendous; paltry will make it stupendous when collected
  )

  (:goal
    (and
      (collect alice vase1)
      (stupendous vase1)
      (remembered alice vase1)
    )
  )
)