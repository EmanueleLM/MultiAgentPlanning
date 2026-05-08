(define (problem trip_10_days_instance)
  (:domain trip_planning)
  (:objects
    reykjavik riga paris - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; first day marker
    (first_day day1)

    ;; day ordering chain
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    ;; direct flights (only the direct connections provided; both directions included where implied)
    (flight paris reykjavik)
    (flight reykjavik paris)
    (flight riga paris)
    (flight paris riga)
  )

  ;; Goals:
  ;; - every day must be assigned to some city
  ;; - days 6-10 must be in reykjavik (annual show)
  ;; - user explicitly requested 5 days in reykjavik, 4 days in paris, and 3 days in riga.
  ;;   These hard requirements together exceed the 10-day total (5 + 4 + 3 = 12).
  ;;   To preserve the user's hard constraints exactly, we encode explicit per-day assignments
  ;;   that capture the requested counts. This makes the instance unsolvable, which faithfully
  ;;   reflects the contradiction in the user's specification.
  (:goal
    (and
      ;; every day assigned
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)
      (assigned day9)
      (assigned day10)

      ;; mandatory attendance at reykjavik for days 6-10 (5 days)
      (at reykjavik day6)
      (at reykjavik day7)
      (at reykjavik day8)
      (at reykjavik day9)
      (at reykjavik day10)

      ;; require 4 days in paris (encoded as specific days)
      (at paris day1)
      (at paris day2)
      (at paris day3)
      (at paris day4)

      ;; require 3 days in riga (encoded as specific days)
      (at riga day1)
      (at riga day2)
      (at riga day3)
    )
  )
)