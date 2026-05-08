(define (problem trip-16days)
  (:domain trip_planning)
  (:objects
    athens zurich krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15) (succ day15 day16)

    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    (direct_flight zurich krakow) (direct_flight krakow zurich)
    (direct_flight athens zurich) (direct_flight zurich athens)

    (total_days_16)
  )

  (:goal (and
    ;; Athens: 5 days (days 1..5) including relatives visit window 1..7
    (at athens day1) (at athens day2) (at athens day3) (at athens day4) (at athens day5)

    ;; flight from Athens to Zurich arriving day6
    (flight_taken athens zurich day6)

    ;; Zurich: 5 days (days 6..10)
    (at zurich day6) (at zurich day7) (at zurich day8) (at zurich day9) (at zurich day10)

    ;; flight from Zurich to Krakow arriving day11
    (flight_taken zurich krakow day11)

    ;; Krakow: 6 days (days 11..16)
    (at krakow day11) (at krakow day12) (at krakow day13) (at krakow day14) (at krakow day15) (at krakow day16)

    (total_days_16)
  ))