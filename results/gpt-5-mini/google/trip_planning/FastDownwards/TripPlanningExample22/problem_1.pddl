(define (problem trip_planning_problem22)
  (:domain trip_planning_domain22)
  (:objects
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    ;; temporal ordering of days
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

    ;; direct flight connectivity (bidirectional where applicable)
    (direct_flight berlin frankfurt)
    (direct_flight frankfurt berlin)
    (direct_flight frankfurt bucharest)
    (direct_flight bucharest frankfurt)
  )

  ;; Goals:
  ;; - Attend the Berlin show period by being in Berlin for days 1..7 (preserves the show attendance)
  ;; - Use remaining days to visit Frankfurt and Bucharest and sum to 11 days.
  ;; The auditor reconciled the original per-city preferences (7+4+2 > 11) by keeping Berlin for days 1..7
  ;; and allocating days 8-9 to Frankfurt and days 10-11 to Bucharest to meet the 11-day total.
  (:goal (and
    (at berlin day1) (at berlin day2) (at berlin day3) (at berlin day4)
    (at berlin day5) (at berlin day6) (at berlin day7)
    (at frankfurt day8) (at frankfurt day9)
    (at bucharest day10) (at bucharest day11)
  ))