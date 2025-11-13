(define (problem audited-itinerary)
  (:domain travel-days)

  (:objects
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; Successor relation for consecutive days 1..17
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)
    (succ day10 day11)
    (succ day11 day12)
    (succ day12 day13)
    (succ day13 day14)
    (succ day14 day15)
    (succ day15 day16)
    (succ day16 day17)

    ;; Direct-flight connectivity (explicitly bidirectional edges)
    (edge manchester bucharest)
    (edge bucharest manchester)
    (edge bucharest lyon)
    (edge lyon bucharest)

    ;; Initial condition: traveler starts in Manchester on day1; day1 marked occupied.
    (at manchester day1)
    (occupied day1)
  )

  ;; Goal: exact daily occupancy mapping for days 1..17 (Lyon fixed on days 13..17).
  (:goal
    (and
      ;; Manchester: days 1..7
      (at manchester day1)
      (at manchester day2)
      (at manchester day3)
      (at manchester day4)
      (at manchester day5)
      (at manchester day6)
      (at manchester day7)

      ;; Bucharest: days 8..12
      (at bucharest day8)
      (at bucharest day9)
      (at bucharest day10)
      (at bucharest day11)
      (at bucharest day12)

      ;; Lyon: days 13..17 (relatives visit window)
      (at lyon day13)
      (at lyon day14)
      (at lyon day15)
      (at lyon day16)
      (at lyon day17)
    )
  )
)