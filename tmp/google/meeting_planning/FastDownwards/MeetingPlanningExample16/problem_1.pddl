(define (problem coordinated-meet-ronald)
  (:domain coordinated-meetings)

  (:objects
    visitor ronald - agent
    chinatown russian-hill - location
    t0 t7 t375 t480 t750 - timepoint
  )

  (:init
    ;; locations
    (at visitor chinatown)
    (at ronald chinatown)

    ;; time starts at 09:00 -> t0
    (time-is t0)

    ;; precomputed availability window predicates (Ronald available 15:15..21:30 -> t375..t750)
    (available-start t375)
    (available-end t750)

    ;; meeting not yet achieved
    ;; (met_105) is false by default; no init predicate
  )

  ;; Goal: ensure at least 105 minutes of meeting (encoded as a single 105-minute meeting block)
  (:goal (met_105))

  (:metric minimize (total-cost))
)