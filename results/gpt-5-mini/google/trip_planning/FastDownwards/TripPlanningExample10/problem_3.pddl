(define (problem trip-9days)
  (:domain trip-planning)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; available direct flights (public information)
    (flight_allowed oslo dublin)
    (flight_allowed dublin oslo)
    (flight_allowed dublin valencia)
    (flight_allowed valencia dublin)

    ;; starting location
    (present oslo day1)
  )

  ;; Goals encode the agents' hard requirements exactly:
  ;; - Spend exactly 3 days in Oslo -> we require presence on days 1-3.
  ;; - Spend exactly 5 days in Valencia, and relatives visit between day5 and day9
  ;;   -> require presence in Valencia on days 5-9 (five days, relatives window covered).
  ;; - Spend exactly 3 days in Dublin -> require presence on three days (here we ask for days 4-6).
  ;; The three duration requirements are inconsistent with the total of 9 days; this goal set is therefore unsatisfiable.
  (:goal (and
    ;; Oslo: 3 days
    (present oslo day1)
    (present oslo day2)
    (present oslo day3)

    ;; Dublin: 3 days (requested by planner_dublin)
    (present dublin day4)
    (present dublin day5)
    (present dublin day6)

    ;; Valencia: 5 days, relatives visit window day5..day9
    (present valencia day5)
    (present valencia day6)
    (present valencia day7)
    (present valencia day8)
    (present valencia day9)
  ))
)