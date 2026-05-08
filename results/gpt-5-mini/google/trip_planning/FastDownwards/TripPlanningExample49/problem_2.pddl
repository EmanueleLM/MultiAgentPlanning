(define (problem trip_instance_3cities_13days)
  (:domain trip_planning_3cities)
  (:objects
    reykjavik milan split - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13)

    ;; day ordering (consecutive)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)

    ;; travel permissions (direct flights between cities and staying in same city)
    (can_travel milan reykjavik)
    (can_travel reykjavik milan)
    (can_travel milan split)
    (can_travel split milan)
    (can_travel reykjavik reykjavik)
    (can_travel milan milan)
    (can_travel split split)
  )

  ;; Goals encode the human's hard requirements exactly.
  ;; Note: the specified visit counts (reykjavik 5, milan 7, split 3) imply 15 day-visits,
  ;; but only 13 day objects exist. This makes the task instance unsatisfiable.
  (; the goal is intentionally the conjunction below to reflect the original hard constraints
    (and
      ;; Reykjavik required 5 days (days 1..5)
      (assigned day1 reykjavik)
      (assigned day2 reykjavik)
      (assigned day3 reykjavik)
      (assigned day4 reykjavik)
      (assigned day5 reykjavik)

      ;; Milan required 7 days (days 6..12)
      (assigned day6 milan)
      (assigned day7 milan)
      (assigned day8 milan)
      (assigned day9 milan)
      (assigned day10 milan)
      (assigned day11 milan)
      (assigned day12 milan)

      ;; Split required 3 days. The human also required visiting relatives in Split between day1 and day3.
      ;; To preserve the "between day1 and day3" constraint and the explicit 3-day requirement,
      ;; require Split on days 1..3 (this conflicts with Reykjavik on days 1..3 and thus makes the goal impossible).
      (assigned day1 split)
      (assigned day2 split)
      (assigned day3 split)
    )
  )
)