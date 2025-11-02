(define (problem TripPlanningExample13_problem)
  (:domain trip_planning_constraints)
  (:objects
    traveler - agent
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; Direct flight network (directed facts)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)
    ;; No direct manchester <-> lyon facts are declared (so direct flight between Manchester and Lyon is unavailable)

    ;; Temporal next relation linking consecutive days
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)
    (next day16 day17)

    ;; Initial location: traveler starts in Manchester on day1
    (at traveler manchester day1)

    ;; All subsequent days are initially unassigned and must be assigned by actions
    (unused day2)
    (unused day3)
    (unused day4)
    (unused day5)
    (unused day6)
    (unused day7)
    (unused day8)
    (unused day9)
    (unused day10)
    (unused day11)
    (unused day12)
    (unused day13)
    (unused day14)
    (unused day15)
    (unused day16)
    (unused day17)

    ;; Constraint encoding using 'forbid' to restrict allowed city on each day.
    ;; Allowed plan (enforced by forbids):
    ;; - Manchester allowed only on days 1-5
    ;; - Bucharest allowed only on days 6-12
    ;; - Lyon allowed only on days 13-17 (this enforces the relatives window and 5-day Lyon stay)

    ;; For days 1-5: forbid being in Bucharest or Lyon
    (forbid day1 bucharest)
    (forbid day1 lyon)
    (forbid day2 bucharest)
    (forbid day2 lyon)
    (forbid day3 bucharest)
    (forbid day3 lyon)
    (forbid day4 bucharest)
    (forbid day4 lyon)
    (forbid day5 bucharest)
    (forbid day5 lyon)

    ;; For days 6-12: forbid being in Manchester or Lyon (so only Bucharest allowed)
    (forbid day6 manchester)
    (forbid day6 lyon)
    (forbid day7 manchester)
    (forbid day7 lyon)
    (forbid day8 manchester)
    (forbid day8 lyon)
    (forbid day9 manchester)
    (forbid day9 lyon)
    (forbid day10 manchester)
    (forbid day10 lyon)
    (forbid day11 manchester)
    (forbid day11 lyon)
    (forbid day12 manchester)
    (forbid day12 lyon)

    ;; For days 13-17: forbid being in Manchester or Bucharest (so only Lyon allowed; fits relatives window)
    (forbid day13 manchester)
    (forbid day13 bucharest)
    (forbid day14 manchester)
    (forbid day14 bucharest)
    (forbid day15 manchester)
    (forbid day15 bucharest)
    (forbid day16 manchester)
    (forbid day16 bucharest)
    (forbid day17 manchester)
    (forbid day17 bucharest)
  )

  ;; Goal: ensure every day of the 17-day trip is assigned (no unused days remain).
  ;; The per-day 'forbid' constraints above force the only feasible city allocation to match the proposed itinerary,
  ;; and the flight network ensures only direct flights are used for inter-city moves.
  (:goal
    (and
      (not (unused day2))
      (not (unused day3))
      (not (unused day4))
      (not (unused day5))
      (not (unused day6))
      (not (unused day7))
      (not (unused day8))
      (not (unused day9))
      (not (unused day10))
      (not (unused day11))
      (not (unused day12))
      (not (unused day13))
      (not (unused day14))
      (not (unused day15))
      (not (unused day16))
      (not (unused day17))
    )
  )
)