(define (problem travel-problem-dbv-vce-11days)
  (:domain travel-domain)
  (:objects
    dbv vce ist - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; chronological ordering of the 11-day trip
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

    ;; direct flights available (only the legs explicitly provided by the flight network)
    (direct dbv vce)
    (direct dbv ist)

    ;; initial location on the first day and that day occupied/visited
    (at dbv day1)
    (occupied day1)
    (visited dbv)
  )

  ;; Goal encodes the human's explicit hard requirements:
  ;; - visit all three cities (Venice, Dubrovnik, Istanbul) at least once
  ;; - occupy every day of the 11-day trip (ensures the planner must allocate all days)
  ;; Note: under the provided direct-flight graph (edges only from dbv -> vce and dbv -> ist),
  ;; it may be impossible to visit all three cities in a single itinerary that uses only direct flights.
  ;; This problem intentionally preserves the original hard requirements so the solver (or an auditor)
  ;; can detect the infeasibility rather than silently relaxing constraints.
  (:goal (and
    (visited dbv)
    (visited vce)
    (visited ist)
    (occupied day1)
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
  ))
)