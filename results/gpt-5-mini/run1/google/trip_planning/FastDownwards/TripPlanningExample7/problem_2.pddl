(define (problem travel-problem-dbv-vce-ist-11days)
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

    ;; direct flights available (only the legs explicitly provided)
    (direct dbv vce)
    (direct dbv ist)

    ;; initial location and first day occupied
    (at dbv day1)
    (occupied day1)
    (visited dbv)
  )

  ;; Hard goals: visit all three cities and use all 11 days of the trip explicitly.
  ;; This encoding enforces the auditor requirement that the plan must allocate all 11 days.
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