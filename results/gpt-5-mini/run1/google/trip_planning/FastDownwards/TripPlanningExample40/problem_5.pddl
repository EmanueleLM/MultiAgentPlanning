(define (problem trip8)
  (:domain trip_planner)
  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    ;; temporal order of days
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)

    ;; available direct flights (bidirectional where specified)
    (flight oslo reykjavik)
    (flight reykjavik oslo)
    (flight oslo manchester)
    (flight manchester oslo)

    ;; trip must start on day1
    (start_day day1)
  )

  ;; The user's requirements are modeled verbatim as hard goal conditions.
  ;; Note: these requirements are jointly inconsistent (sum of requested city-days > 8).
  (:goal (and
    ;; every day must be assigned
    (assigned day1) (assigned day2) (assigned day3) (assigned day4)
    (assigned day5) (assigned day6) (assigned day7) (assigned day8)

    ;; user's city-day requirements (preserved exactly as stated)
    ;; oslo: 6 days
    (at oslo day1) (at oslo day2) (at oslo day3) (at oslo day4) (at oslo day5) (at oslo day6)

    ;; reykjavik: 2 days
    (at reykjavik day7) (at reykjavik day8)

    ;; manchester: 2 days (attend wedding between day1 and day2)
    (at manchester day1) (at manchester day2)
  ))
)