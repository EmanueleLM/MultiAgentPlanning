(define (problem trip_problem_10_days)
  (:domain jack_of_all_trades_trip)
  (:objects
    reykjavik milan porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    req_reykjavik_1 req_reykjavik_2 req_reykjavik_3 req_reykjavik_4 req_reykjavik_5 req_reykjavik_6
    req_milan_1 req_milan_2 req_milan_3 req_milan_4
    req_porto_1 req_porto_2 - req_token
  )

  (:init
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9) (succ day9 day10)

    (first_day day1)

    (direct_flight reykjavik milan)
    (direct_flight milan reykjavik)
    (direct_flight milan porto)
    (direct_flight porto milan)

    (req_open req_reykjavik_1) (req_open req_reykjavik_2) (req_open req_reykjavik_3)
    (req_open req_reykjavik_4) (req_open req_reykjavik_5) (req_open req_reykjavik_6)
    (req_open req_milan_1) (req_open req_milan_2) (req_open req_milan_3) (req_open req_milan_4)
    (req_open req_porto_1) (req_open req_porto_2)

    (req_for req_reykjavik_1 reykjavik) (req_for req_reykjavik_2 reykjavik)
    (req_for req_reykjavik_3 reykjavik) (req_for req_reykjavik_4 reykjavik)
    (req_for req_reykjavik_5 reykjavik) (req_for req_reykjavik_6 reykjavik)

    (req_for req_milan_1 milan) (req_for req_milan_2 milan)
    (req_for req_milan_3 milan) (req_for req_milan_4 milan)

    (req_for req_porto_1 porto) (req_for req_porto_2 porto)
  )

  (:goal (and
    ;; hard day-count requirements (these reflect the user's exact counts;
    ;; note: the total required days is 12 which exceeds the 10 available days,
    ;; so this problem is intentionally unsolvable but faithfully encodes the specification)
    (req_satisfied req_reykjavik_1) (req_satisfied req_reykjavik_2)
    (req_satisfied req_reykjavik_3) (req_satisfied req_reykjavik_4)
    (req_satisfied req_reykjavik_5) (req_satisfied req_reykjavik_6)

    (req_satisfied req_milan_1) (req_satisfied req_milan_2)
    (req_satisfied req_milan_3) (req_satisfied req_milan_4)

    (req_satisfied req_porto_1) (req_satisfied req_porto_2)

    ;; Porto show constraint: day9 and day10 must be Porto
    (at porto day9)
    (at porto day10)

    ;; all days must be assigned
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3)) (not (unassigned day4))
    (not (unassigned day5)) (not (unassigned day6)) (not (unassigned day7)) (not (unassigned day8))
    (not (unassigned day9)) (not (unassigned day10))
  ))
)