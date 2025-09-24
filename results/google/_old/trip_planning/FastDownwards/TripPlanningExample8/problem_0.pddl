(define (problem trip-krakow-athens-zurich)
  (:domain trip-multiagent)

  (:objects
    krakow athens zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; Allowed occupancy: we choose a feasible schedule that fits in 16 unique days
    ;; and respects the individual stay durations by assigning contiguous allowed days.
    ;; Krakow: 6 days -> day1 .. day6
    (allowed-krakow day1) (allowed-krakow day2) (allowed-krakow day3)
    (allowed-krakow day4) (allowed-krakow day5) (allowed-krakow day6)

    ;; Athens: 7 days -> day6 .. day12 (overlaps day6 with Krakow)
    (allowed-athens day6) (allowed-athens day7) (allowed-athens day8)
    (allowed-athens day9) (allowed-athens day10) (allowed-athens day11) (allowed-athens day12)

    ;; Zurich: 5 days -> day12 .. day16 (overlaps day12 with Athens)
    (allowed-zurich day12) (allowed-zurich day13) (allowed-zurich day14)
    (allowed-zurich day15) (allowed-zurich day16)

    ;; Relatives in Athens must be visited between day1 and day7 inclusive
    (allowed-relatives day1) (allowed-relatives day2) (allowed-relatives day3)
    (allowed-relatives day4) (allowed-relatives day5) (allowed-relatives day6) (allowed-relatives day7)

    ;; Direct flights allowed (only direct flights allowed by the problem)
    (direct-flight krakow athens)
    (direct-flight athens zurich)
    ;; Note: no direct-flight krakow zurich to enforce only direct legs krakow->athens->zurich
  )

  (:goal
    (and
      ;; Ensure the required number of days are occupied in each city.
      ;; The allowed-* predicates define contiguous blocks we intend to occupy.
      (in-krakow day1) (in-krakow day2) (in-krakow day3)
      (in-krakow day4) (in-krakow day5) (in-krakow day6)

      (in-athens day6) (in-athens day7) (in-athens day8)
      (in-athens day9) (in-athens day10) (in-athens day11) (in-athens day12)

      (in-zurich day12) (in-zurich day13) (in-zurich day14)
      (in-zurich day15) (in-zurich day16)

      ;; Use only direct flights between consecutive cities on the overlap days
      ;; (these record that a direct-leg was used on the overlapping day)
      (flew krakow athens day6)
      (flew athens zurich day12)

      ;; Visit relatives in Athens between day1 and day7; here we require the visit
      ;; to occur on an allowed day. Given the chosen occupancy, day6 is in Athens and
      ;; is within day1..day7, so we require the visit to happen on day6.
      (visited-relatives day6)
    )
  )
)