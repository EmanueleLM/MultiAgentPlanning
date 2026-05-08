(define (problem trip_plan_instance)
  (:domain jack_of_all_trades)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    frankfurt reykjavik split - city
    req_f_1 req_f_2
    req_r_1 req_r_2 req_r_3
    req_s_1 req_s_2 req_s_3 req_s_4 req_s_5 req_s_6 req_s_7
    req_workshop
    - req
  )
  (:init
    ;; all days start unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    ;; day order / adjacency
    (first_day day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    ;; direct flights (bidirectional as specified)
    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight frankfurt split)
    (direct_flight split frankfurt)

    ;; workshop window membership
    (in_workshop_window day8) (in_workshop_window day9) (in_workshop_window day10)

    ;; requirement tokens target cities
    (req_for req_f_1 frankfurt) (req_for req_f_2 frankfurt)
    (req_for req_r_1 reykjavik) (req_for req_r_2 reykjavik) (req_for req_r_3 reykjavik)
    (req_for req_s_1 split) (req_for req_s_2 split) (req_for req_s_3 split)
    (req_for req_s_4 split) (req_for req_s_5 split) (req_for req_s_6 split) (req_for req_s_7 split)

    ;; note: req_workshop is satisfied via satisfy_workshop using an in-window reykjavik day;
    ;; it does not have a req_for binding and is tracked via (workshop_satisfied)

    ;; No other predicates (assigned, day_filled, day_bound, req_satisfied, workshop_satisfied) are true initially.
  )

  (:goal
    (and
      ;; all city-count requirement tokens must be satisfied
      (req_satisfied req_f_1) (req_satisfied req_f_2)
      (req_satisfied req_r_1) (req_satisfied req_r_2) (req_satisfied req_r_3)
      (req_satisfied req_s_1) (req_satisfied req_s_2) (req_satisfied req_s_3)
      (req_satisfied req_s_4) (req_satisfied req_s_5) (req_satisfied req_s_6) (req_satisfied req_s_7)

      ;; workshop requirement must be satisfied
      (workshop_satisfied)

      ;; all days must be filled
      (day_filled day1) (day_filled day2) (day_filled day3) (day_filled day4) (day_filled day5)
      (day_filled day6) (day_filled day7) (day_filled day8) (day_filled day9) (day_filled day10)
    )
  )
)