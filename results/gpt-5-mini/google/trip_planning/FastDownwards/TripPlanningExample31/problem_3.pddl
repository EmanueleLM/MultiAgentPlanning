(define (problem trip_plan_instance)
  (:domain jack_of_all_trades)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    frankfurt reykjavik split - city
    req_f1 req_f2 req_r1 req_r2 req_r3 req_s1 req_s2 req_s3 req_s4 req_s5 req_s6 req_s7 - req
  )
  (:init
    ;; all days initially unassigned and available to be consumed once
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    (unconsumed_day day1) (unconsumed_day day2) (unconsumed_day day3) (unconsumed_day day4) (unconsumed_day day5)
    (unconsumed_day day6) (unconsumed_day day7) (unconsumed_day day8) (unconsumed_day day9) (unconsumed_day day10)

    (first_day day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    ;; direct flights (bidirectional only where specified)
    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight frankfurt split)
    (direct_flight split frankfurt)

    ;; workshop window: must attend workshop in reykjavik on one of these days
    (in_workshop_window day8) (in_workshop_window day9) (in_workshop_window day10)

    ;; requirements encoding the requested number of days in each city
    ;; NOTE: these sum to 12 required city-days (2+3+7) while only 10 days exist;
    ;; this models the user's hard request exactly (instance is therefore infeasible).
    (req_for req_f1 frankfurt) (req_for req_f2 frankfurt)
    (req_for req_r1 reykjavik) (req_for req_r2 reykjavik) (req_for req_r3 reykjavik)
    (req_for req_s1 split) (req_for req_s2 split) (req_for req_s3 split)
    (req_for req_s4 split) (req_for req_s5 split) (req_for req_s6 split) (req_for req_s7 split)
  )

  (:goal
    (and
      ;; require exact counts: each req object must be satisfied (each consumes one distinct day's unconsumed token)
      (req_satisfied req_f1) (req_satisfied req_f2)
      (req_satisfied req_r1) (req_satisfied req_r2) (req_satisfied req_r3)
      (req_satisfied req_s1) (req_satisfied req_s2) (req_satisfied req_s3)
      (req_satisfied req_s4) (req_satisfied req_s5) (req_satisfied req_s6) (req_satisfied req_s7)
      (workshop_satisfied)
    )
  )
)