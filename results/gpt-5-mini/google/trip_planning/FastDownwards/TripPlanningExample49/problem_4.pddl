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

    ;; linear day ordering
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)

    ;; direct flights (commutes). Only the stated direct connections are present.
    (can_travel milan reykjavik)
    (can_travel reykjavik milan)
    (can_travel milan split)
    (can_travel split milan)

    ;; allow staying in the same city from one day to the next (no flight required)
    (can_travel reykjavik reykjavik)
    (can_travel milan milan)
    (can_travel split split)
  )

  ;; The goal encodes the human's hard constraints verbatim:
  ;; - total planning horizon: 13 days (days enumerated above)
  ;; - desires: reykjavik 5 days, milan 7 days, split 3 days
  ;; - relatives visit in split between day1 and day3
  ;;
  ;; Note: these explicit day assignments are mutually inconsistent
  ;; (they require the same day(s) to be assigned to different cities),
  ;; so the instance is unsolvable as given. We encode the constraints
  ;; exactly rather than silently repairing them.
  (:goal
    (and
      ;; Reykjavik required 5 days (explicit listing)
      (assigned day1 reykjavik)
      (assigned day2 reykjavik)
      (assigned day3 reykjavik)
      (assigned day4 reykjavik)
      (assigned day5 reykjavik)

      ;; Milan required 7 days (explicit listing)
      (assigned day6 milan)
      (assigned day7 milan)
      (assigned day8 milan)
      (assigned day9 milan)
      (assigned day10 milan)
      (assigned day11 milan)
      (assigned day12 milan)

      ;; Split required 3 days and relatives visit between day1 and day3
      ;; (the user requested split between day1 and day3; we interpret this
      ;; as requiring days 1..3 to be assigned to split)
      (assigned day1 split)
      (assigned day2 split)
      (assigned day3 split)
    )
  )
)