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

    ;; direct flights (only the given direct connections; directed facts)
    (flight Amsterdam Santorini)
    (flight Santorini Amsterdam)
    (flight Istanbul Amsterdam)
    (flight Amsterdam Istanbul)
  )

  ;; Hard goals as specified by the traveler:
  ;; - total horizon 14 days (encoded by day objects above)
  ;; - Amsterdam for 7 days
  ;; - Istanbul for 6 days
  ;; - Santorini for 3 days, with Santorini visit occupying days 12-14 inclusive
  ;; These are encoded here as explicit day assignments (this preserves the original hard constraints;
  ;; the combination of these goals is infeasible because 7+6+3 > 14, which intentionally reflects
  ;; the original specification rather than silently relaxing it).
  (:goal (and
    ;; Amsterdam for 7 days (specified concretely)
    (at day1 Amsterdam) (at day2 Amsterdam) (at day3 Amsterdam)
    (at day4 Amsterdam) (at day5 Amsterdam) (at day6 Amsterdam) (at day7 Amsterdam)

    ;; Istanbul for 6 days (specified concretely)
    (at day8 Istanbul) (at day9 Istanbul) (at day10 Istanbul)
    (at day11 Istanbul) (at day12 Istanbul) (at day13 Istanbul)

    ;; Santorini for 3 days, relatives window days 12-14 (specified concretely)
    (at day12 Santorini) (at day13 Santorini) (at day14 Santorini)
  ))
)