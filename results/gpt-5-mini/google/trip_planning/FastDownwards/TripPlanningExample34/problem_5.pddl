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

    ;; day order chain (consecutive days)
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

  ;; Hard user constraints encoded exactly as per the specification.
  ;; Note: these constraints are inconsistent (they demand more city-days than the 9 available).
  ;; The model preserves the user's explicit per-day requirements to expose infeasibility.
  (:goal (and
    ;; relatives in Valencia between day1 and day2 -> enforce day1 and day2 in valencia
    (at valencia day1)
    (at valencia day2)

    ;; stay in Frankfurt for 5 days -> enforce five specific days in frankfurt
    (at frankfurt day3)
    (at frankfurt day4)
    (at frankfurt day5)
    (at frankfurt day6)
    (at frankfurt day7)

    ;; visit Florence for 4 days -> enforce four specific days in florence
    (at florence day6)
    (at florence day7)
    (at florence day8)
    (at florence day9)
  ))
)