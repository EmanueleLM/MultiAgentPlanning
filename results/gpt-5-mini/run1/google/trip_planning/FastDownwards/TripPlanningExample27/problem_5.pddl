(define (problem tripplanningexample27-problem)
  (:domain trip_planning)

  (:objects
    amsterdam istanbul santorini - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ;; day ordering (day1 -> ... -> day14)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; designate start
    (first-day day1)

    ;; direct flights encoded exactly as provided (directed)
    (flight amsterdam santorini)
    (flight istanbul amsterdam)
  )

  ;; Hard goal: encode the traveler's stated hard constraints verbatim.
  ;; These constraints are inconsistent with the 14-day horizon (they require 16 day-assignments),
  ;; and with the provided directed flights; the encoding preserves that unsatisfiability.
  (:goal (and
    ;; Amsterdam for 7 days (day1..day7)
    (at day1 amsterdam) (at day2 amsterdam) (at day3 amsterdam)
    (at day4 amsterdam) (at day5 amsterdam) (at day6 amsterdam) (at day7 amsterdam)

    ;; Istanbul for 6 days (day8..day13)
    (at day8 istanbul) (at day9 istanbul) (at day10 istanbul)
    (at day11 istanbul) (at day12 istanbul) (at day13 istanbul)

    ;; Santorini for 3 days and relatives visit between day12..day14 inclusive
    (at day12 santorini) (at day13 santorini) (at day14 santorini)
  ))
)