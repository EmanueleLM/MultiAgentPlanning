(define (problem trip-vienna-vilnius-valencia)
  (:domain trip-planning)

  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ; direct flight connections (public / agent-provided)
    (flight vienna valencia)
    (flight valencia vienna)
    (flight vienna vilnius)
    (flight vilnius vienna)

    ; time succession relations for 15-day trip
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15)

    ; starting location: Vienna on day1 (chosen to enable connectivity to both other cities;
    ; this respects Vienna agent presence and provided flight links)
    (at vienna day1)

    ; counters: reflect that day1 is already assigned to Vienna
    (= (vienna-count) 1)
    (= (vilnius-count) 0)
    (= (valencia-count) 0)
  )

  (:goal
    (and
      ; preserve agents' reported planned stays as hard constraints
      (= (vienna-count) 5)
      (= (vilnius-count) 5)
      (= (valencia-count) 7)

      ; conference attendance hard constraints in Valencia on day9 and day15
      (at valencia day9)
      (at valencia day15)
    )
  )

  ; Note: The domain and problem encode only direct flights between specified cities,
  ; discrete day-to-day transitions, and the agents' hard constraints (planned stays
  ; and conference days). Given the public data (total trip length 15 days) and the
  ; summed planned stays (5+5+7 = 17 days), these constraints are globally inconsistent;
  ; the planner may therefore report the problem as unsolvable.
)