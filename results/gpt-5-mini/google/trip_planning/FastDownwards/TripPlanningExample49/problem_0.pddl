(define (problem trip_instance_3cities_13days)
  (:domain jack_of_all_trades_trip)
  (:objects
    reykjavik milan split - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ; all days start unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)
    (unassigned day11) (unassigned day12) (unassigned day13)

    ; direct flights (bidirectional as specified)
    (direct_flight milan reykjavik)
    (direct_flight reykjavik milan)
    (direct_flight milan split)
    (direct_flight split milan)

    ; can_travel is reflexive plus the listed direct edges
    (can_travel reykjavik reykjavik)
    (can_travel milan milan)
    (can_travel split split)
    (can_travel milan reykjavik)
    (can_travel reykjavik milan)
    (can_travel milan split)
    (can_travel split milan)
  )

  ; Goal encodes the hard per-city visit-length requirements as concrete assigned(...) atoms,
  ; and requires the relatives-visit-window flag visited_split_early to be true.
  ; Note: the per-city required totals sum to 15 (5+7+3) while only 13 day slots exist,
  ; so the goal set is unsatisfiable as stated in the original specification.
  (:goal (and
    ; Reykjavik required 5 days
    (assigned reykjavik day1)
    (assigned reykjavik day2)
    (assigned reykjavik day3)
    (assigned reykjavik day4)
    (assigned reykjavik day5)

    ; Milan required 7 days
    (assigned milan day6)
    (assigned milan day7)
    (assigned milan day8)
    (assigned milan day9)
    (assigned milan day10)
    (assigned milan day11)
    (assigned milan day12)

    ; Split required 3 days
    (assigned split day11)
    (assigned split day12)
    (assigned split day13)

    ; Hard relatives visit window: must visit split between day1 and day3 inclusive.
    ; Modeled as the propositional flag that must be set by assigning split on day1/day2/day3.
    (visited_split_early)
  ))
)