(define (problem trip_plan_instance)
  (:domain trip_planning_instance)

  (:objects
    frankfurt florence valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; direct flights (both directions where applicable)
    (direct_flight frankfurt florence)
    (direct_flight florence frankfurt)
    (direct_flight valencia frankfurt)
    (direct_flight frankfurt valencia)

    ;; day order chain
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; mark the first day (allows start_day to initialize day1)
    (is_first day1)
  )

  (:goal (and
    ;; fixed visits requested in the specification:
    ;; relatives in Valencia on day1 and day2
    (at valencia day1)
    (at valencia day2)

    ;; stay in Frankfurt for 5 days (here chosen as days 3..7 to make a feasible itinerary)
    (at frankfurt day3)
    (at frankfurt day4)
    (at frankfurt day5)
    (at frankfurt day6)
    (at frankfurt day7)

    ;; visit Florence on the remaining days (days 8..9)
    (at florence day8)
    (at florence day9)
  ))
)