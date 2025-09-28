(define (problem trip-12days)
  (:domain trip-planning)
  (:objects
    venice zurich florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ;; start location
    (at venice)

    ;; direct flight connections (only direct flights allowed)
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    ;; available day tokens: total budget of 12 days
    (day-available day1)
    (day-available day2)
    (day-available day3)
    (day-available day4)
    (day-available day5)
    (day-available day6)
    (day-available day7)
    (day-available day8)
    (day-available day9)
    (day-available day10)
    (day-available day11)
    (day-available day12)

    ;; initial counters for days spent in each city
    (venice-days-0)
    (florence-days-0)
    (zurich-days-0)
  )

  ;; Goals reflect the human specification: desired stays.
  ;; Note: the sum of these required stays (6+6+2 = 14) exceeds the available 12 days;
  ;; this models the stated (inconsistent) hard requirements exactly.
  (:goal (and
    (venice-days-6)
    (florence-days-6)
    (zurich-days-2)
  ))
)