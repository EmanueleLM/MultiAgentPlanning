(define (problem TripPlanningExample27-problem)
  (:domain trip-planning)

  (:objects
    Amsterdam Istanbul Santorini - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ; day ordering
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ; mark first day
    (first-day day1)

    ; direct flights (both directions explicitly included)
    (flight Amsterdam Santorini)
    (flight Santorini Amsterdam)
    (flight Istanbul Amsterdam)
    (flight Amsterdam Istanbul)

    ; Note: no day is assigned initially; actions set assignments
  )

  ; Goals encode the traveler's requested durations and Santorini relatives window exactly as given.
  ; These goals follow the specification (they may be mutually inconsistent, which preserves the original constraints).
  (:goal (and
    ;; Amsterdam for 7 days: days 1-7
    (at day1 Amsterdam) (at day2 Amsterdam) (at day3 Amsterdam)
    (at day4 Amsterdam) (at day5 Amsterdam) (at day6 Amsterdam) (at day7 Amsterdam)

    ;; Istanbul for 6 days: days 8-13
    (at day8 Istanbul) (at day9 Istanbul) (at day10 Istanbul)
    (at day11 Istanbul) (at day12 Istanbul) (at day13 Istanbul)

    ;; Santorini for 3 days and relatives window: days 12-14 inclusive
    (at day12 Santorini) (at day13 Santorini) (at day14 Santorini)
  ))
)