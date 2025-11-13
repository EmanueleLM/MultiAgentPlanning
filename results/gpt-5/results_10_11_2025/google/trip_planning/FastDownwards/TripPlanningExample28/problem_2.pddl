(define (problem tripplanningexample28-12d)
  (:domain european-trip)
  (:objects
    venice zurich florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )
  (:init
    ; day succession and terminal marker
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

    ; direct flight connectivity (directional)
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    ; start state
    (at-city venice)
    (at-day day1)

    ; audited itinerary: exact city assignment per day (6V, 2Z, 4F)
    (must-stay day1 venice)
    (must-stay day2 venice)
    (must-stay day3 venice)
    (must-stay day4 venice)
    (must-stay day5 venice)
    (must-stay day6 venice)
    (must-stay day7 zurich)
    (must-stay day8 zurich)
    (must-stay day9 florence)
    (must-stay day10 florence)
    (must-stay day11 florence)
    (must-stay day12 florence)
  )
  (:goal (and
    ; all 12 days must be scheduled exactly once
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
    ; cursor ends on the terminal day
    (at-day day12)
  ))
)