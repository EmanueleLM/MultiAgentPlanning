(define (problem trip_plan_instance)
  (:domain trip_planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    frankfurt reykjavik split - city
  )
  (:init
    (first_day day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    (free day1) (free day2) (free day3) (free day4) (free day5)
    (free day6) (free day7) (free day8) (free day9) (free day10)

    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight frankfurt split)
    (direct_flight split frankfurt)

    (in_workshop_window day8) (in_workshop_window day9) (in_workshop_window day10)
  )

  (:goal (and
    ;; User hard requirements preserved exactly (these requirements are inconsistent with a 10-day itinerary;
    ;; the instance is therefore unsatisfiable, which is preserved by this encoding).
    ;; Frankfurt: 2 days required
    (at day6 frankfurt)
    (at day7 frankfurt)

    ;; Reykjavik: 3 days required (one must be in the workshop window)
    (at day8 reykjavik)
    (at day9 reykjavik)
    (at day10 reykjavik)

    ;; Split: 7 days required
    (at day1 split)
    (at day2 split)
    (at day3 split)
    (at day4 split)
    (at day5 split)
    (at day6 split)
    (at day7 split)

    ;; workshop attendance must be marked by the action
    (workshop_satisfied)
  ))
)