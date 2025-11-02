(define (problem trip-11days-integrated)
  (:domain trip-multiagent)

  (:objects
    reykjavik vienna venice - city
  )

  ;; Initial state
  (:init
    ;; start in Reykjavik
    (at reykjavik)

    ;; direct flights (only direct legs allowed)
    (flight reykjavik vienna)
    (flight vienna reykjavik)
    (flight vienna venice)
    (flight venice vienna)

    ;; day counters and per-city day counters start at 0
    (= (day) 0)
    (= (days_in_reykjavik) 0)
    (= (days_in_vienna) 0)
    (= (days_in_venice) 0)
  )

  ;; Goals: total trip length 11 days, attend wedding in Venice between day 8 and 11,
  ;; and respect the planners' specified stays as reconciled to fit the 11-day total.
  ;; Reykjavik: exactly 2 days (private requirement preserved)
  ;; Venice: 4 days (planner requirement preserved)
  ;; Vienna: remaining 5 days to make total 11 (reconciled)
  (:goal (and
    (= (day) 11)
    (= (days_in_reykjavik) 2)
    (= (days_in_venice) 4)
    (= (days_in_vienna) 5)
    (attended-wedding)
  ))