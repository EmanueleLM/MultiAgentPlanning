(define (problem trip_13_days)
  (:domain jack_of_all_trades_trip)
  (:objects
    florence warsaw munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ;; designate the trip start day
    (is_start day1)

    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13)

    ;; linear successor chain for days
    (prev_day day1 day2)
    (prev_day day2 day3)
    (prev_day day3 day4)
    (prev_day day4 day5)
    (prev_day day5 day6)
    (prev_day day6 day7)
    (prev_day day7 day8)
    (prev_day day8 day9)
    (prev_day day9 day10)
    (prev_day day10 day11)
    (prev_day day11 day12)
    (prev_day day12 day13)

    ;; direct flights as provided (do not invent other routes)
    (flight florence munich)
    (flight munich warsaw)
  )

  ;; Hard goal: requested per-city day assignments preserved exactly.
  ;; Note: The user's requested totals (2 days in Florence + 7 in Warsaw + 6 in Munich = 15)
  ;; exceed the available 13 days; this goal is therefore unsatisfiable under the model.
  (:goal (and
    ;; florence: 2 days
    (assigned day1 florence)
    (assigned day2 florence)

    ;; warsaw: 7 days
    (assigned day3 warsaw)
    (assigned day4 warsaw)
    (assigned day5 warsaw)
    (assigned day6 warsaw)
    (assigned day7 warsaw)
    (assigned day8 warsaw)
    (assigned day9 warsaw)

    ;; munich: 6 days
    (assigned day8 munich)
    (assigned day9 munich)
    (assigned day10 munich)
    (assigned day11 munich)
    (assigned day12 munich)
    (assigned day13 munich)
  ))
)