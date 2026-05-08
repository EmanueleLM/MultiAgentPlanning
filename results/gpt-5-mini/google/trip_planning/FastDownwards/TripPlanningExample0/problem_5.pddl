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

    ;; Florence meeting window: days 9..14 inclusive
    (florence_window day9)
    (florence_window day10)
    (florence_window day11)
    (florence_window day12)
    (florence_window day13)
    (florence_window day14)

    ;; city identity
    (is_florence florence)
    (is_barcelona barcelona)
    (is_helsinki helsinki)

    ;; allowed direct flights (bidirectional)
    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight helsinki barcelona)
    (direct_flight barcelona helsinki)

    ;; start day
    (first_day day1)
  )

  (:goal (and
    ;; The orchestrator/auditor chose a concrete allocation that fits 14 days while honoring the Florence meeting window.
    ;; Helsinki: days 1..4 (4 days)
    (at helsinki day1)
    (at helsinki day2)
    (at helsinki day3)
    (at helsinki day4)

    ;; Barcelona: days 5,12,13,14 (4 days)
    (at barcelona day5)
    (at barcelona day12)
    (at barcelona day13)
    (at barcelona day14)

    ;; Florence: days 6..11 (6 days)
    (at florence day6)
    (at florence day7)
    (at florence day8)
    (at florence day9)
    (at florence day10)
    (at florence day11)

    ;; Meeting constraint satisfied: at least one Florence-window day assigned to Florence
    (florence_met)
  ))
)