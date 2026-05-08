(define (problem trip_plan_instance)
  (:domain trip_planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    frankfurt reykjavik split - city
  )
  (:init
    ;; temporal ordering of days
    (first_day day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    ;; direct flights (bidirectional where specified)
    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight frankfurt split)
    (direct_flight split frankfurt)

    ;; workshop window: must attend Reykjavik on one of these days
    (in_workshop_window day8) (in_workshop_window day9) (in_workshop_window day10)
  )

  ;; Hard user requirements encoded as exact per-day assignments.
  ;; The user's request requires 2 days in Frankfurt, 3 days in Reykjavik (one of them in days 8-10),
  ;; and 7 days in Split. These totals (2+3+7 = 12) exceed the available 10 days; the model
  ;; preserves those hard requirements exactly. The resulting instance is therefore infeasible,
  ;; but the constraints are encoded structurally here.
  (:goal (and
    ;; Frankfurt: 2 days required
    (assigned day6 frankfurt)
    (assigned day7 frankfurt)

    ;; Reykjavik: 3 days required (must include a day in the workshop window)
    (assigned day8 reykjavik)
    (assigned day9 reykjavik)
    (assigned day10 reykjavik)

    ;; Split: 7 days required
    (assigned day1 split)
    (assigned day2 split)
    (assigned day3 split)
    (assigned day4 split)
    (assigned day5 split)
    (assigned day6 split)
    (assigned day7 split)

    ;; explicit workshop attendance flag (must be set by mark_workshop)
    (workshop_satisfied)
  ))
)