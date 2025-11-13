(define (problem audited-itinerary)
  (:domain travel-days)

  (:objects
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; Successor (contiguous days 1..17)
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

    ;; Connectivity graph (only the given direct-flight edges; both directions declared to allow travel in either direction along these links)
    (edge manchester bucharest)
    (edge bucharest manchester)
    (edge bucharest lyon)
    (edge lyon bucharest)

    ;; Initial occupancy: traveler starts in Manchester on day1; day1 is occupied.
    (at manchester day1)
    (occupied day1)
  )

  ;; Goal: the audited/corrected itinerary requires:
  ;; - Manchester on day1
  ;; - Bucharest on days 2..12
  ;; - Lyon on days 13..17 (5-day contiguous stay enforced)
  ;; These are enforced as hard goals so any plan violating them is infeasible.
  (:goal
    (and
      ;; day1
      (at manchester day1)
      ;; days 2..12 in Bucharest
      (at bucharest day2)
      (at bucharest day3)
      (at bucharest day4)
      (at bucharest day5)
      (at bucharest day6)
      (at bucharest day7)
      (at bucharest day8)
      (at bucharest day9)
      (at bucharest day10)
      (at bucharest day11)
      (at bucharest day12)
      ;; days 13..17 in Lyon (5-day stay)
      (at lyon day13)
      (at lyon day14)
      (at lyon day15)
      (at lyon day16)
      (at lyon day17)
      ;; Require that each day is occupied (this enforces contiguity: days must be filled in order starting from day1)
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