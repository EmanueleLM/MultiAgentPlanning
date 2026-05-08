(define (problem itinerary-16days-dubrovnik)
  (:domain travel-orchestration)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day

    dubrovnik - city

    traveler1 orchestrator1 - agent
  )

  (:init
    ;; day membership
    (day day1) (day day2) (day day3) (day day4) (day day5) (day day6)
    (day day7) (day day8) (day day9) (day day10) (day day11) (day day12)
    (day day13) (day day14) (day day15) (day day16)

    ;; successor (explicit contiguity)
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    ;; city facts
    (city dubrovnik)

    ;; agents roles
    (traveler traveler1)
    (orchestrator orchestrator1)

    ;; initial locations on day1 (explicit)
    (at traveler1 dubrovnik day1)
    (at orchestrator1 dubrovnik day1)

    ;; NOTE: No direct flight connectivity facts are included here.
    ;; The flight_plan and audit report provided no permitted direct flights
    ;; (or they were represented as zero entries). Therefore no fly_* actions
    ;; that require (direct ...) will be applicable. This enforces that
    ;; movement by flight is impossible unless a direct connection is present
    ;; in the problem init. This follows the instruction to not invent connectivity.
  )

  (:goal (and
    ;; Enforce the audited/required presence constraints:
    ;; traveler must be in Dubrovnik on day12 and day16.
    (at traveler1 dubrovnik day12)
    (at traveler1 dubrovnik day16)
  ))
)