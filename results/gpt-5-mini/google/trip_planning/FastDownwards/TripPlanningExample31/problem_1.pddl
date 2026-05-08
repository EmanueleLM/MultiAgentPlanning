(define (problem trip_plan_instance)
  (:domain jack_of_all_trades)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    frankfurt reykjavik split - city
    req_f1 req_f2
    req_r1 req_r2 req_r3
    req_s1 req_s2 req_s3 req_s4 req_s5 req_s6 req_s7
    - req
  )
  (:init
    ;; all days start unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    ;; day order
    (first_day day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    ;; direct flights (only allowed direct commutes)
    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight frankfurt split)
    (direct_flight split frankfurt)

    ;; workshop window days (day8..day10)
    (in_workshop_window day8) (in_workshop_window day9) (in_workshop_window day10)

    ;; requirement tokens: requested numbers of days in each city
    ;; frankfurt: 2 days
    (req_for req_f1 frankfurt) (req_for req_f2 frankfurt)
    ;; reykjavik: 3 days
    (req_for req_r1 reykjavik) (req_for req_r2 reykjavik) (req_for req_r3 reykjavik)
    ;; split: 7 days
    (req_for req_s1 split) (req_for req_s2 split) (req_for req_s3 split)
    (req_for req_s4 split) (req_for req_s5 split) (req_for req_s6 split) (req_for req_s7 split)
  )

  (:goal
    (and
      ;; all city-count requirement tokens must be satisfied
      (req_satisfied req_f1) (req_satisfied req_f2)
      (req_satisfied req_r1) (req_satisfied req_r2) (req_satisfied req_r3)
      (req_satisfied req_s1) (req_satisfied req_s2) (req_satisfied req_s3)
      (req_satisfied req_s4) (req_satisfied req_s5) (req_satisfied req_s6) (req_satisfied req_s7)

      ;; workshop requirement must be satisfied
      (workshop_satisfied)
    )
  )
)