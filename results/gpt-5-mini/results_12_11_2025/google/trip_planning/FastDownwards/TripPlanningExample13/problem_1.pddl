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

    ;; Connectivity graph (bidirectional edges where direct flights exist)
    (edge manchester bucharest)
    (edge bucharest manchester)
    (edge bucharest lyon)
    (edge lyon bucharest)

    ;; Initial condition: traveler starts in Manchester on day1; day1 is occupied.
    (at manchester day1)
    (occupied day1)
  )

  ;; Goal: enforce the audited itinerary as hard constraints so any plan that solves this problem
  ;; must place the traveler in the specified city for each day. This enforces:
  ;;  - Manchester days 1..7
  ;;  - Bucharest days 8..12
  ;;  - Lyon days 13..17 (exactly 5 days and the required relatives window)
  ;;  - All days 2..17 are occupied (ensures a continuous timeline from day1)
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

      ;; Lyon: days 13..17 (5 days exactly)
      (at lyon day13)
      (at lyon day14)
      (at lyon day15)
      (at lyon day16)
      (at lyon day17)

      ;; Require every day to be occupied (day1 already in init; enforce remaining days)
      (occupied day2)
      (occupied day3)
      (occupied day4)
      (occupied day5)
      (occupied day6)
      (occupied day7)
      (occupied day8)
      (occupied day9)
      (occupied day10)
      (occupied day11)
      (occupied day12)
      (occupied day13)
      (occupied day14)
      (occupied day15)
      (occupied day16)
      (occupied day17)
    )
  )
)