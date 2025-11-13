(define (problem audited-itinerary-12d)
  (:domain trip-itinerary)
  (:objects
    venice zurich florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )
  (:init
    ; day succession and terminal
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
    (last-day day12)

    ; direct flights (policy: direct only)
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    ; start state
    (at-city venice)
    (at-day day1)

    ; day scheduling status
    (unscheduled day1)
    (unscheduled day2)
    (unscheduled day3)
    (unscheduled day4)
    (unscheduled day5)
    (unscheduled day6)
    (unscheduled day7)
    (unscheduled day8)
    (unscheduled day9)
    (unscheduled day10)
    (unscheduled day11)
    (unscheduled day12)

    ; audited itinerary: exact city-by-day assignment
    (must-stay day1 venice)
    (must-stay day2 venice)
    (must-stay day3 venice)
    (must-stay day4 venice)
    (must-stay day5 venice)
    (must-stay day6 zurich)
    (must-stay day7 zurich)
    (must-stay day8 florence)
    (must-stay day9 florence)
    (must-stay day10 florence)
    (must-stay day11 florence)
    (must-stay day12 florence)

    ; enforce route with boundary flights only at specific days
    (allowed-flight-at day6 venice zurich)
    (pending-flight day6)
    (allowed-flight-at day8 zurich florence)
    (pending-flight day8)
  )
  (:goal (and
    ; all 12 days scheduled exactly once
    (scheduled day1)
    (scheduled day2)
    (scheduled day3)
    (scheduled day4)
    (scheduled day5)
    (scheduled day6)
    (scheduled day7)
    (scheduled day8)
    (scheduled day9)
    (scheduled day10)
    (scheduled day11)
    (scheduled day12)
    ; end on terminal day and in final city
    (at-day day12)
    (at-city florence)
  ))
)