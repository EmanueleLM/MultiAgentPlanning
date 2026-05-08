(define (problem trip_problem_10_days)
  (:domain jack_of_all_trades_trip)
  (:objects
    reykjavik milan porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    ;; req tokens encode required number of days to be spent in each city
    req_reykjavik_1 req_reykjavik_2 req_reykjavik_3 req_reykjavik_4 req_reykjavik_5 req_reykjavik_6
    req_milan_1 req_milan_2 req_milan_3 req_milan_4
    req_porto_1 req_porto_2 - req_token
  )

  (:init
    ;; All days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    ;; Day succession
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9) (succ day9 day10)

    ;; First day marker
    (first_day day1)

    ;; Direct flight connections (only allowed direct flights)
    (direct_flight reykjavik milan)
    (direct_flight milan reykjavik)
    (direct_flight milan porto)
    (direct_flight porto milan)

    ;; Available req tokens (open) matching user's stated day counts
    (req_open req_reykjavik_1) (req_open req_reykjavik_2) (req_open req_reykjavik_3)
    (req_open req_reykjavik_4) (req_open req_reykjavik_5) (req_open req_reykjavik_6)
    (req_open req_milan_1) (req_open req_milan_2) (req_open req_milan_3) (req_open req_milan_4)
    (req_open req_porto_1) (req_open req_porto_2)

    ;; Map each req token to its city
    (req_for req_reykjavik_1 reykjavik) (req_for req_reykjavik_2 reykjavik)
    (req_for req_reykjavik_3 reykjavik) (req_for req_reykjavik_4 reykjavik)
    (req_for req_reykjavik_5 reykjavik) (req_for req_reykjavik_6 reykjavik)

    (req_for req_milan_1 milan) (req_for req_milan_2 milan)
    (req_for req_milan_3 milan) (req_for req_milan_4 milan)

    (req_for req_porto_1 porto) (req_for req_porto_2 porto)
  )

  (:goal (and
    ;; Enforce user's exact day-count requirements (these sum to 12 days)
    (req_satisfied req_reykjavik_1) (req_satisfied req_reykjavik_2)
    (req_satisfied req_reykjavik_3) (req_satisfied req_reykjavik_4)
    (req_satisfied req_reykjavik_5) (req_satisfied req_reykjavik_6)

    (req_satisfied req_milan_1) (req_satisfied req_milan_2)
    (req_satisfied req_milan_3) (req_satisfied req_milan_4)

    (req_satisfied req_porto_1) (req_satisfied req_porto_2)

    ;; Porto show constraint: days 9 and 10 must be in Porto
    (at porto day9)
    (at porto day10)

    ;; All days must be assigned (no unassigned days remain)
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3)) (not (unassigned day4))
    (not (unassigned day5)) (not (unassigned day6)) (not (unassigned day7)) (not (unassigned day8))
    (not (unassigned day9)) (not (unassigned day10))
  ))
)