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

    ;; direct flights (bidirectional where specified)
    (direct_flight zurich krakow) (direct_flight krakow zurich)
    (direct_flight athens zurich) (direct_flight zurich athens)

    ;; enforce the 16-day horizon as a hard fact
    (total_days_16)
  )

  ;; Hard (agent) constraints encoded exactly as goals.
  ;; Note: the agents' requested durations sum to 18 days (7 + 5 + 6), which exceeds the 16-day horizon.
  ;; These are preserved as hard goals; the resulting planning problem is therefore intentionally unsatisfiable.
  (:goal (and
    ;; athens: occupy days 1..7 (visit relatives between day1 and day7 inclusive)
    (at athens day1) (at athens day2) (at athens day3)
    (at athens day4) (at athens day5) (at athens day6) (at athens day7)

    ;; require a direct flight arriving to zurich on day8 from athens (to start zurich stay)
    (flight_taken athens zurich day8)

    ;; zurich: occupy 5 days (explicitly anchored to days 8..12 to make the requirement concrete)
    (at zurich day8) (at zurich day9) (at zurich day10) (at zurich day11) (at zurich day12)

    ;; require a direct flight arriving to krakow on day11 from zurich
    (flight_taken zurich krakow day11)

    ;; krakow: occupy 6 days (explicitly anchored to days 11..16 to express the requested duration)
    (at krakow day11) (at krakow day12) (at krakow day13)
    (at krakow day14) (at krakow day15) (at krakow day16)

    ;; preserve horizon fact
    (total_days_16)
  ))
)