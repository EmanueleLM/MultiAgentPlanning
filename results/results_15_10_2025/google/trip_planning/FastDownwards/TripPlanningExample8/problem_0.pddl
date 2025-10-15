(define (problem trip-16days)
  (:domain trip-planning)
  (:objects
    traveler - agent
    athens zurich krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; Allowed direct flights (only these are available)
    (connected athens zurich)
    (connected zurich athens)
    (connected zurich krakow)
    (connected krakow zurich)

    ;; Day ordering (discrete consecutive days)
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    ;; Starting location (day1 must be in Athens)
    (at traveler athens day1)
  )

  (:goal
    (and
      ;; Athens stay fixed and strict: days 1..7 in Athens
      (at traveler athens day1)
      (at traveler athens day2)
      (at traveler athens day3)
      (at traveler athens day4)
      (at traveler athens day5)
      (at traveler athens day6)
      (at traveler athens day7)

      ;; Zurich stay for 5 days: days 8..12
      (at traveler zurich day8)
      (at traveler zurich day9)
      (at traveler zurich day10)
      (at traveler zurich day11)
      (at traveler zurich day12)

      ;; Krakow stay (shortened to fit 16 days): days 13..16
      (at traveler krakow day13)
      (at traveler krakow day14)
      (at traveler krakow day15)
      (at traveler krakow day16)
    )
  )
)