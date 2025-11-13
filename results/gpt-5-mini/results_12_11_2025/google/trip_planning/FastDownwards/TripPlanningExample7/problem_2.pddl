(define (problem TripPlanningExample7-problem)
  (:domain TripPlanningExample7)
  (:objects
    dubrovnik venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    ;; time succession (discrete days 1..11)
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

    ;; fixed per-day ownership to enforce exact per-city durations (auditor-approved allocation)
    ;; Dubrovnik: days 1-4
    (day-belongs day1 dubrovnik)
    (day-belongs day2 dubrovnik)
    (day-belongs day3 dubrovnik)
    (day-belongs day4 dubrovnik)
    ;; Venice: days 5-11
    (day-belongs day5 venice)
    (day-belongs day6 venice)
    (day-belongs day7 venice)
    (day-belongs day8 venice)
    (day-belongs day9 venice)
    (day-belongs day10 venice)
    (day-belongs day11 venice)

    ;; start: located in Dubrovnik on day1
    (at dubrovnik day1)

    ;; allowed directed flights (only those stated)
    (edge dubrovnik venice)
  )

  (:goal
    (and
      ;; must occupy Dubrovnik exactly on days 1..4
      (at dubrovnik day1)
      (at dubrovnik day2)
      (at dubrovnik day3)
      (at dubrovnik day4)

      ;; must occupy Venice exactly on days 5..11
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