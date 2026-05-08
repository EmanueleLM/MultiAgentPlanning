(define (problem trip_instance_3cities_13days)
  (:domain trip_planning_3cities)
  (:objects
    reykjavik milan split - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13)

    ; day ordering (consecutive)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)

    ; travel permissions (direct flights + staying in same city)
    (can_travel milan reykjavik)
    (can_travel reykjavik milan)
    (can_travel milan split)
    (can_travel split milan)
    (can_travel reykjavik reykjavik)
    (can_travel milan milan)
    (can_travel split split)
  )

  ; Goals encode the hard visit-length requirements by enumerating which days are allocated
  ; to each city for this instance. The specified totals (5,7,3) sum to 15 while only 13
  ; day slots exist, so the goal set is necessarily unsatisfiable for this instance.
  (:goal (and
    ; Reykjavik required 5 days (day1..day5)
    (assigned day1 reykjavik)
    (assigned day2 reykjavik)
    (assigned day3 reykjavik)
    (assigned day4 reykjavik)
    (assigned day5 reykjavik)

    ; Milan required 7 days (day6..day12)
    (assigned day6 milan)
    (assigned day7 milan)
    (assigned day8 milan)
    (assigned day9 milan)
    (assigned day10 milan)
    (assigned day11 milan)
    (assigned day12 milan)

    ; Split required 3 days (one of them must be between day1 and day3 to visit relatives)
    (assigned day3 split)
    (assigned day11 split)
    (assigned day12 split)
  ))
)