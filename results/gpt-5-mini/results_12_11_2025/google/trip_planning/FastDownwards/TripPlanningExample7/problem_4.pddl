(define (problem TripPlanningExample7-problem)
  (:domain TripPlanningExample7)
  (:objects
    dubrovnik venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    ;; discrete day succession (explicit ordered timeline)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; Auditor-approved per-day allocations (each day belongs to exactly one city).
    ;; Dubrovnik: days 1-4 (4 days)
    (day-belongs day1 dubrovnik)
    (day-belongs day2 dubrovnik)
    (day-belongs day3 dubrovnik)
    (day-belongs day4 dubrovnik)

    ;; Venice: days 5-11 (7 days)
    (day-belongs day5 venice)
    (day-belongs day6 venice)
    (day-belongs day7 venice)
    (day-belongs day8 venice)
    (day-belongs day9 venice)
    (day-belongs day10 venice)
    (day-belongs day11 venice)

    ;; initial location: start in Dubrovnik on day1
    (at dubrovnik day1)

    ;; allowed directed flights (only explicitly provided, non-symmetric)
    (edge dubrovnik venice)
  )

  (:goal
    (and
      ;; occupancy must match the allocated days exactly (terminal condition)
      (at dubrovnik day1)
      (at dubrovnik day2)
      (at dubrovnik day3)
      (at dubrovnik day4)

      (at venice day5)
      (at venice day6)
      (at venice day7)
      (at venice day8)
      (at venice day9)
      (at venice day10)
      (at venice day11)
    )
  )
)