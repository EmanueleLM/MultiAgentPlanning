(define (problem trip-krakow-athens-zurich)
  (:domain trip-multiagent)
  (:objects
    krakow athens zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )
  (:init
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    ;; allowed days for each city (agents' desired durations mapped into the day range)
    ;; Krakow desired 6 days -> allow day1..day6
    (allowed-krakow day1) (allowed-krakow day2) (allowed-krakow day3)
    (allowed-krakow day4) (allowed-krakow day5) (allowed-krakow day6)

    ;; Athens desired 7 days -> allow day6..day12 (overlaps day6 with Krakow on purpose per specification conflict)
    (allowed-athens day6) (allowed-athens day7) (allowed-athens day8)
    (allowed-athens day9) (allowed-athens day10) (allowed-athens day11) (allowed-athens day12)

    ;; Zurich desired 5 days -> allow day12..day16 (overlaps day12 with Athens)
    (allowed-zurich day12) (allowed-zurich day13) (allowed-zurich day14)
    (allowed-zurich day15) (allowed-zurich day16)

    ;; relatives must be visited between day1 and day7
    (allowed-relatives day1) (allowed-relatives day2) (allowed-relatives day3)
    (allowed-relatives day4) (allowed-relatives day5) (allowed-relatives day6) (allowed-relatives day7)

    ;; direct flights (bidirectional for listed connections)
    (direct-flight zurich krakow)
    (direct-flight krakow zurich)
    (direct-flight athens zurich)
    (direct-flight zurich athens)
  )
  (:goal
    (and
      ;; Krakow: 6 days required
      (in-krakow day1) (in-krakow day2) (in-krakow day3)
      (in-krakow day4) (in-krakow day5) (in-krakow day6)

      ;; Athens: 7 days required (overlaps day6)
      (in-athens day6) (in-athens day7) (in-athens day8)
      (in-athens day9) (in-athens day10) (in-athens day11) (in-athens day12)

      ;; Zurich: 5 days required (overlaps day12)
      (in-zurich day12) (in-zurich day13) (in-zurich day14)
      (in-zurich day15) (in-zurich day16)

      ;; Visit relatives during Athens stay and within day1..day7 (choose day6 which is within allowed range)
      (visited-relatives day6)
    )
  )
)