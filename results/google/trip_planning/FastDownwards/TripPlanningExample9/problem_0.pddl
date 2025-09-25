(define (problem trip-10days)
  (:domain travel-multiagent)
  (:objects
    frankfurt bucharest stuttgart - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    ;; Initial location: traveler starts in Bucharest (no assumption was specified; this allows a feasible plan).
    (at-traveler bucharest)

    ;; Day sequencing: day1 .. day10, with day11 as the "after" sentinel.
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)

    ;; Start assigning from day1
    (current-day day1)

    ;; Define the workshop window: days 5..10
    (in-window day5) (in-window day6) (in-window day7) (in-window day8) (in-window day9) (in-window day10)

    ;; Direct flight network (shared public info + flight_scheduler private info)
    (direct bucharest frankfurt) (direct frankfurt bucharest)
    (direct frankfurt stuttgart) (direct stuttgart frankfurt)
    ;; No direct Bucharest <-> Stuttgart is intentionally omitted.

    ;; Numeric counters start at 0
    (= (spent-frankfurt) 0)
    (= (spent-bucharest) 0)
    (= (spent-stuttgart) 0)
    (= (day-count) 0)
  )

  ;; Goals:
  ;; - Spend exactly 3 days in Frankfurt
  ;; - Spend exactly 3 days in Bucharest
  ;; - Use exactly 10 days total (day-count = 10)
  ;; - Attend the workshop in Stuttgart sometime between day5 and day10 (workshop-attended)
  (:goal (and
    (= (spent-frankfurt) 3)
    (= (spent-bucharest) 3)
    (= (day-count) 10)
    (workshop-attended)
  ))
)