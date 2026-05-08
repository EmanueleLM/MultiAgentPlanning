(define (problem trip8)
  (:domain trip_planner)
  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)

    (flight oslo reykjavik)
    (flight reykjavik oslo)
    (flight manchester oslo)
    (flight oslo manchester)

    (start_available)
  )

  ;; The goals encode the user's hard constraints exactly.
  ;; Note: the user's per-city day counts are inconsistent with the total of 8 days.
  ;; This encoding preserves the user's requirements verbatim; the instance is therefore
  ;; expected to be unsolvable (no valid plan exists that meets all constraints).
  (:goal (and
    ;; every day must be assigned
    (assigned day1) (assigned day2) (assigned day3) (assigned day4)
    (assigned day5) (assigned day6) (assigned day7) (assigned day8)

    ;; user's city-day count requirements (preserved exactly)
    ;; oslo: 6 days
    (at oslo day1) (at oslo day2) (at oslo day3) (at oslo day4) (at oslo day5) (at oslo day6)

    ;; reykjavik: 2 days
    (at reykjavik day7) (at reykjavik day8)

    ;; manchester: 2 days
    (at manchester day1) (at manchester day2)
  ))
)