(define (problem trip_planning_14days_problem)
  (:domain trip_planning_14days)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    florence barcelona helsinki - city
  )

  (:init
    ;; day successor chain
    (day_succ day1 day2)
    (day_succ day2 day3)
    (day_succ day3 day4)
    (day_succ day4 day5)
    (day_succ day5 day6)
    (day_succ day6 day7)
    (day_succ day7 day8)
    (day_succ day8 day9)
    (day_succ day9 day10)
    (day_succ day10 day11)
    (day_succ day11 day12)
    (day_succ day12 day13)
    (day_succ day13 day14)

    ;; Florence meeting window days 9..14
    (florence_window day9)
    (florence_window day10)
    (florence_window day11)
    (florence_window day12)
    (florence_window day13)
    (florence_window day14)

    ;; identify city constants
    (is_florence florence)
    (is_barcelona barcelona)
    (is_helsinki helsinki)

    ;; allowed direct flights (bidirectional as separate facts)
    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight helsinki barcelona)
    (direct_flight barcelona helsinki)

    ;; mark the first day
    (first_day day1)
  )

  (:goal (and
    ;; Every day must be assigned a city (enforces total trip length of 14 days).
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
    (assigned day11)
    (assigned day12)
    (assigned day13)
    (assigned day14)

    ;; Visit each of the three cities at least once during the trip.
    (visited_florence)
    (visited_barcelona)
    (visited_helsinki)

    ;; Enforce that the Florence meeting constraint is satisfied:
    ;; some day between day9..day14 must be assigned to Florence (captured by florence_met).
    (florence_met)
  ))