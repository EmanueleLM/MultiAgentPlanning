(define (problem TripPlanningExample9)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    frankfurt bucharest stuttgart - city
  )

  (:init
    ;; successor relation for consecutive days (day10 -> day11 sentinel)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)

    ;; initially all real days are unassigned
    (day-unassigned day1) (day-unassigned day2) (day-unassigned day3)
    (day-unassigned day4) (day-unassigned day5) (day-unassigned day6)
    (day-unassigned day7) (day-unassigned day8) (day-unassigned day9)
    (day-unassigned day10)

    ;; next-to-assign starts at day1; mark first-day
    (next-to-assign day1)
    (first-day day1)

    ;; each city's contiguous block is available exactly once (enforces exact counts by block sizes)
    (city-available bucharest) (city-available frankfurt) (city-available stuttgart)

    ;; workshop window days (day5..day10)
    (window-day day5) (window-day day6) (window-day day7)
    (window-day day8) (window-day day9) (window-day day10)

    ;; direct flight graph (bidirectional)
    (flight bucharest frankfurt) (flight frankfurt bucharest)
    (flight frankfurt stuttgart) (flight stuttgart frankfurt)
  )

  (:goal
    (and
      ;; all real days must be assigned
      (not (day-unassigned day1)) (not (day-unassigned day2)) (not (day-unassigned day3))
      (not (day-unassigned day4)) (not (day-unassigned day5)) (not (day-unassigned day6))
      (not (day-unassigned day7)) (not (day-unassigned day8)) (not (day-unassigned day9))
      (not (day-unassigned day10))
      ;; must acknowledge workshop attendance (requires at least one stuttgart day inside window)
      (attended-workshop)
    )
  )
)