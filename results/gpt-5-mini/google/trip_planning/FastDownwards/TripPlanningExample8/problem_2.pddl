(define (problem trip-16days)
  (:domain trip-planning)
  (:objects
    athens zurich krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; discrete timeline
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15) (succ day15 day16)

    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    ;; direct flights (given connectivity). Interpret "A and B" as bidirectional links:
    (direct_flight zurich krakow) (direct_flight krakow zurich)
    (direct_flight athens zurich) (direct_flight zurich athens)

    ;; enforce the 16-day horizon as a hard fact
    (total_days_16)
  )

  (:goal (and
    ;; Athens preference and relative-visit constraint: 7 consecutive days starting at day1
    (at athens day1) (at athens day2) (at athens day3)
    (at athens day4) (at athens day5) (at athens day6) (at athens day7)

    ;; outbound from Athens: must take a direct flight arriving on day8
    (flight_taken athens zurich day8)

    ;; Zurich stay: days 8..10
    (at zurich day8) (at zurich day9) (at zurich day10)

    ;; outbound from Zurich to Krakow: arrive day11
    (flight_taken zurich krakow day11)

    ;; Krakow stay: 6 days, days 11..16
    (at krakow day11) (at krakow day12) (at krakow day13)
    (at krakow day14) (at krakow day15) (at krakow day16)

    ;; preserve horizon fact
    (total_days_16)
  ))
)