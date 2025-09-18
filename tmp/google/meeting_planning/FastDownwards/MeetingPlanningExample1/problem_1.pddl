(define (problem meet-betty-compiled-problem)
  (:domain meet-betty-compiled)
  (:objects
    richmond financial - location
    t540 t562 t1035 t1095 t1245 t1305 - timepoint
  )
  (:init
    ;; initial location and time
    (at-you richmond)
    (at-betty financial)
    (now t540)

    ;; Betty's availability window start and latest allowed meeting-start (precomputed as timepoints)
    (in-window t1035)
    (in-window t1245)

    ;; Precomputed time transitions (symbolic arithmetic encoded as predicates)
    ;; Travel Richmond->Financial: 540 -> 562 (540 + 22 = 562)
    (can-travel-rd-fd t540 t562)

    ;; Wait from arriving early at Financial until Betty's availability: 562 -> 1035
    (can-wait t562 t1035)

    ;; Meeting start->end pair: 1035 -> 1095 (meeting lasts 60)
    (can-meet-start t1035 t1095)

    ;; Additional precomputed points (unused in this minimal model but available)
    ;; latest possible start and window end kept for completeness
    ;; (could have other transitions if needed)
    (can-wait t1035 t1245)
    (can-travel-fd-rd t562 t583) ; example if needed: 562 + 21 = 583 (not used in this plan)
    ;; initial cost
    (= (total-cost) 0)
  )
  (:goal (met))
  (:metric minimize (total-cost))
)