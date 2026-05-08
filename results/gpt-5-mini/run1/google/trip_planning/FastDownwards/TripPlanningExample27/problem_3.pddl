(define (problem tripplanningexample27-problem)
  (:domain trip_planning)

  (:objects
    Amsterdam Istanbul Santorini - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ;; day ordering (day1 -> day2 -> ... -> day14)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; mark first day
    (first-day day1)

    ;; direct flights (directed, only the given connections)
    ;; Given connections: Amsterdam -> Santorini, Istanbul -> Amsterdam
    (flight Amsterdam Santorini)
    (flight Istanbul Amsterdam)
  )

  ;; Hard constraints encoded directly as explicit per-day assignments.
  ;; These reflect the traveler's stated durations and the Santorini window.
  ;; Note: the combination of these explicit assignments is inconsistent (requires 16 day-assignments over a 14-day horizon),
  ;; which intentionally preserves the original hard requirements rather than silently relaxing them.
  (:goal (and
    ;; Amsterdam for 7 days (explicitly assigned to day1..day7)
    (at day1 Amsterdam) (at day2 Amsterdam) (at day3 Amsterdam)
    (at day4 Amsterdam) (at day5 Amsterdam) (at day6 Amsterdam) (at day7 Amsterdam)

    ;; Istanbul for 6 days (explicitly assigned to day8..day13)
    (at day8 Istanbul) (at day9 Istanbul) (at day10 Istanbul)
    (at day11 Istanbul) (at day12 Istanbul) (at day13 Istanbul)

    ;; Santorini for 3 days, relatives window days 12-14 inclusive (explicitly assigned to day12..day14)
    (at day12 Santorini) (at day13 Santorini) (at day14 Santorini)
  ))
)