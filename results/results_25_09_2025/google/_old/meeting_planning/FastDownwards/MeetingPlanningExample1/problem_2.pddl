(define (problem meet-betty-compiled-problem)
  (:domain meet-betty-compiled)
  (:objects
    richmond financial - location
    t540 t562 t583 t1035 t1095 t1245 t1305 - timepoint
  )
  (:init
    ;; initial location and time
    (at-you richmond)
    (at-betty financial)
    (now t540)

    ;; Betty's availability window (valid meeting start timepoints)
    (in-window t1035)
    (in-window t1245)

    ;; Precomputed time transitions (symbolic)
    ;; Travel Richmond->Financial: 540 -> 562 (540 + 22 = 562)
    (can-travel-rd-fd t540 t562)
    (travel-cost-22 t540 t562)

    ;; Example travel Financial->Richmond: 562 -> 583 (562 + 21 = 583)
    (can-travel-fd-rd t562 t583)
    (travel-cost-21 t562 t583)

    ;; Wait from arriving early at Financial until Betty's availability: 562 -> 1035 (473 minutes)
    (can-wait t562 t1035)
    (wait-cost-473 t562 t1035)

    ;; Additional wait possibility inside window: 1035 -> 1245 (210 minutes)
    (can-wait t1035 t1245)
    (wait-cost-210 t1035 t1245)

    ;; Meeting start->end pair: 1035 -> 1095 (meeting lasts 60)
    (can-meet-start t1035 t1095)
    (meet-cost-60 t1035 t1095)
  )
  (:goal (met))
)