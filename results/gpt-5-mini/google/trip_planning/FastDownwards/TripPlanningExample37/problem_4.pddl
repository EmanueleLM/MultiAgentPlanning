(define (problem trip_problem_10_days)
  (:domain jack_of_all_trades_trip)
  (:objects
    reykjavik milan porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    req_reykjavik_1 req_reykjavik_2 req_reykjavik_3 req_reykjavik_4 req_reykjavik_5 req_reykjavik_6
    req_milan_1 req_milan_2 req_milan_3 req_milan_4
    req_porto_1 req_porto_2 - token
  )

  (:init
    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    ;; successor relation for consecutive days
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9) (succ day9 day10)

    ;; start of the trip
    (first_day day1)

    ;; direct flight connectivity (only given links)
    (direct_flight reykjavik milan)
    (direct_flight milan reykjavik)
    (direct_flight milan porto)
    (direct_flight porto milan)

    ;; tokens representing required day-count assignments (as specified by human)
    (token_open req_reykjavik_1) (token_open req_reykjavik_2) (token_open req_reykjavik_3)
    (token_open req_reykjavik_4) (token_open req_reykjavik_5) (token_open req_reykjavik_6)
    (token_open req_milan_1) (token_open req_milan_2) (token_open req_milan_3) (token_open req_milan_4)
    (token_open req_porto_1) (token_open req_porto_2)

    (token_for req_reykjavik_1 reykjavik) (token_for req_reykjavik_2 reykjavik)
    (token_for req_reykjavik_3 reykjavik) (token_for req_reykjavik_4 reykjavik)
    (token_for req_reykjavik_5 reykjavik) (token_for req_reykjavik_6 reykjavik)

    (token_for req_milan_1 milan) (token_for req_milan_2 milan)
    (token_for req_milan_3 milan) (token_for req_milan_4 milan)

    (token_for req_porto_1 porto) (token_for req_porto_2 porto)
  )

  (:goal (and
    ;; satisfy the requested counts by consuming all tokens (note: total requested days = 12)
    (token_used req_reykjavik_1) (token_used req_reykjavik_2)
    (token_used req_reykjavik_3) (token_used req_reykjavik_4)
    (token_used req_reykjavik_5) (token_used req_reykjavik_6)

    (token_used req_milan_1) (token_used req_milan_2)
    (token_used req_milan_3) (token_used req_milan_4)

    (token_used req_porto_1) (token_used req_porto_2)

    ;; mandatory attendance: Porto on day9 and day10 (annual show spans day9->day10)
    (at porto day9)
    (at porto day10)

    ;; every day must be assigned
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3)) (not (unassigned day4))
    (not (unassigned day5)) (not (unassigned day6)) (not (unassigned day7)) (not (unassigned day8))
    (not (unassigned day9)) (not (unassigned day10))
  ))
)