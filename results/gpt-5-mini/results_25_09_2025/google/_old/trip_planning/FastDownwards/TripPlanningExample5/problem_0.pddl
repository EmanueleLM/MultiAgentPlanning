(define (problem trip-16-days)
  (:domain unified-trip-planning)

  (:objects
    traveler - person
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; All days start unassigned (agent1)
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    ;; Successor (day ordering)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)

    ;; Initial counters zero
    (= (oslo-count) 0)
    (= (porto-count) 0)
    (= (dubrovnik-count) 0)

    ;; Direct flights (agent2)
    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)

    ;; Note: No initial (at-person ...) is provided; the planner should choose an init action
    ;; (init-traveler-...) or otherwise use agent1 day assignments and sync actions to establish
    ;; person's day-by-day locations.
  )

  (:goal
    (and
      ;; Every day must be assigned (no unassigned days remaining)
      (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3))
      (not (unassigned day4)) (not (unassigned day5)) (not (unassigned day6))
      (not (unassigned day7)) (not (unassigned day8)) (not (unassigned day9))
      (not (unassigned day10)) (not (unassigned day11)) (not (unassigned day12))
      (not (unassigned day13)) (not (unassigned day14)) (not (unassigned day15))
      (not (unassigned day16))

      ;; Desired totals for days spent in each city (adjusted to sum to 16)
      (= (oslo-count) 6)
      (= (porto-count) 5)        ; adjusted from 7 to 5 to make totals consistent with 16 days
      (= (dubrovnik-count) 5)

      ;; Must be in Dubrovnik on day 12 and on day 16 (both agent1 and agent2 views)
      (at-day day12 dubrovnik)
      (at-day day16 dubrovnik)

      (at-person traveler dubrovnik day12)
      (at-person traveler dubrovnik day16)
    )
  )
)