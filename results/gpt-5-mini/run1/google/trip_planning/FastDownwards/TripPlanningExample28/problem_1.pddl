; Problem: trip-instance-28
; This problem encodes the reconciled allocations:
;  - venice : 5 days (day1..day5)
;  - zurich : 2 days (day6..day7)
;  - florence: 5 days (day8..day12)
; The trip starts in venice on day1 and uses only the provided direct flights:
;   venice <-> zurich (both directions), zurich -> florence (one-way).
(define (problem trip-instance-28)
  (:domain trip-planning)

  (:objects
    venice florence zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ; day ordering (successor links)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12)

    ; all visiting days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)

    ; start location (assumed conservatively to enable a feasible plan)
    (at venice day1)

    ; direct flights as specified by the route planner
    (directflight venice zurich)
    (directflight zurich venice)   ; bidirectional between venice and zurich
    (directflight zurich florence) ; direct flight from zurich to florence
  )

  ; Goals: assign all 12 days, and enforce the reconciled per-city day allocation
  ; by requiring the traveller to be in the listed city on each respective day.
  (:goal (and
    ; all days assigned
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3)) (not (unassigned day4))
    (not (unassigned day5)) (not (unassigned day6)) (not (unassigned day7)) (not (unassigned day8))
    (not (unassigned day9)) (not (unassigned day10)) (not (unassigned day11)) (not (unassigned day12))

    ; venice: day1..day5 (5 days)
    (at venice day1) (at venice day2) (at venice day3) (at venice day4) (at venice day5)

    ; zurich: day6..day7 (2 days)
    (at zurich day6) (at zurich day7)

    ; florence: day8..day12 (5 days)
    (at florence day8) (at florence day9) (at florence day10) (at florence day11) (at florence day12)
  ))
)