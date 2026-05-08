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

  ;; Goal encodes the human's hard constraints exactly.
  ;; Note: the specification requests 5 days in frankfurt, 4 days in florence, and 2 days in valencia
  ;; within a 9-day trip. These constraints are contradictory (5+4+2 = 11 > 9). We preserve the
  ;; user's exact day-count requests here; the instance is therefore infeasible.
  (:goal (and
    ;; relatives in Valencia between day1 and day2 (explicitly day1 and day2)
    (at valencia day1)
    (at valencia day2)

    ;; stay in Frankfurt for 5 days (explicit days chosen: day3..day7)
    (at frankfurt day3)
    (at frankfurt day4)
    (at frankfurt day5)
    (at frankfurt day6)
    (at frankfurt day7)

    ;; visit Florence for 4 days (explicit days chosen: day6..day9)
    ;; This intentionally overlaps days with the frankfurt requirement to preserve the original,
    ;; explicit user requests and thus exposes the infeasibility of the instance.
    (at florence day6)
    (at florence day7)
    (at florence day8)
    (at florence day9)
  ))
)