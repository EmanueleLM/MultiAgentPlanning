(define (problem trip-16days)
  (:domain trip_planning)
  (:objects
    athens zurich krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; day ordering
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15) (succ day15 day16)

    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    ;; direct flights (bidirectional as given)
    (direct_flight zurich krakow) (direct_flight krakow zurich)
    (direct_flight athens zurich) (direct_flight zurich athens)

    (total_days_16)
  )

  ;; NOTE: The agents' hard requirements (athens: 7 days, zurich: 5 days, krakow: 6 days)
  ;; sum to 18 days while total_days is 16. This problem therefore encodes the
  ;; original agents' hard constraints exactly; the instance is infeasible (conflicting)
  ;; and a planner will report no solution. The encoding intentionally preserves the
  ;; specified per-city day allocations and the direct-flight constraints.
  (:goal (and
    ;; Athens: 7 days (days 1..7). Agents required relatives visit between day1..day7.
    (at athens day1) (at athens day2) (at athens day3) (at athens day4)
    (at athens day5) (at athens day6) (at athens day7)

    ;; flight from Athens to Zurich arriving day8 (requires being in Athens on day7 and arrival on day8)
    (flight_taken athens zurich day8)

    ;; Zurich: 5 days (days 8..12)
    (at zurich day8) (at zurich day9) (at zurich day10) (at zurich day11) (at zurich day12)

    ;; flight from Zurich to Krakow arriving day11 (conflicts with being at Zurich day11 above)
    (flight_taken zurich krakow day11)

    ;; Krakow: 6 days (days 11..16) -- overlaps with Zurich on days 11..12, creating the infeasibility
    (at krakow day11) (at krakow day12) (at krakow day13) (at krakow day14) (at krakow day15) (at krakow day16)

    (total_days_16)
  ))