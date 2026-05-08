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

  ;; Auditor correction:
  ;; The flight graph (edges only dbv->vce and dbv->ist) makes it impossible to visit
  ;; all three cities in one itinerary starting at Dubrovnik while using only direct flights,
  ;; because there are no direct legs from Venice or Istanbul back to Dubrovnik or between them.
  ;; Therefore the auditor proposes a feasible allocation that preserves the traveler's
  ;; preferences as much as possible while respecting the 11-day total:
  ;; - Visit Dubrovnik for 5 days (day1..day5) and Venice for 6 days (day6..day11).
  ;; Istanbul is not visited in this feasible corrected allocation.
  ;; The PDDL goal below encodes that corrected, realizable requirement.

  (:goal (and
    (visited dbv)
    (visited vce)
    ;; occupy every day of the 11-day trip (ensures all days are assigned)
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