(define (problem traveler-14day-itinerary)
  (:domain travel-itinerary)
  (:objects
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ;; Unassigned days initially (days 1–11). Days 12–14 are preassigned to Santorini (hard requirement).
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11)
    ;; day12/day13/day14 are not unassigned; they are pre-assigned below to enforce relatives window.

    ;; Temporal successor links
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; The trip starts on day1
    (is-first day1)

    ;; Direct-flight adjacency (as provided by flights agent) and reflexive adjacency to allow staying in the same city overnight
    (adjacent amsterdam santorini)
    (adjacent santorini amsterdam)
    (adjacent amsterdam istanbul)
    (adjacent istanbul amsterdam)

    (adjacent amsterdam amsterdam)
    (adjacent santorini santorini)
    (adjacent istanbul istanbul)

    ;; Hard constraints: enforce Santorini visit window by pre-assigning days 12–14 to Santorini
    (assigned day12 santorini)
    (assigned day13 santorini)
    (assigned day14 santorini)
  )

  (:goal
    (and
      ;; All days must be assigned (ensures total trip length exactly 14 days)
      (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3))
      (not (unassigned day4)) (not (unassigned day5)) (not (unassigned day6))
      (not (unassigned day7)) (not (unassigned day8)) (not (unassigned day9))
      (not (unassigned day10)) (not (unassigned day11)) (not (unassigned day12))
      (not (unassigned day13)) (not (unassigned day14))

      ;; Reinforce Santorini relatives window explicitly in the goal as hard constraints
      (assigned day12 santorini) (assigned day13 santorini) (assigned day14 santorini)
    )
  )
)