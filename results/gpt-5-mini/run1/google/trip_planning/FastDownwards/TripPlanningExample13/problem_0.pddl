(define (problem trip-planning-instance)
  (:domain trip-planning)

  (:objects
    ; cities
    manchester bucharest lyon - city

    ; days (strictly modeled as the planner's calendar days 1..17)
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10
    day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; start of calendar
    (start day1)

    ;; successor links for contiguous calendar days (enforces linear day order)
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

    ;; NOTE: there are intentionally no (assigned ...) or (in ...) facts initially.
    ;; The planner must assign each day to cities using assign-start and assign-next actions.

    ;; Connectivity: only these direct flight legs exist (enforced by the action schemas).
    ;; (No explicit facts needed here beyond the domain's action definitions.)
  )

  (:goal
    (and
      ;; Trip-length hard constraint: the planner's modeled calendar ends at day17.
      ;; The final occupancy must be realized within the day1..day17 window.
      ;; (This is encoded by only providing day objects up to day17.)

      ;; Hard requested per-city stays (encoded as explicit day assignments).
      ;; These are the user's original requested durations treated as strict constraints.
      ;; Manchester requested 7 days -> require Manchester on days 1..7
      (in manchester day1)
      (in manchester day2)
      (in manchester day3)
      (in manchester day4)
      (in manchester day5)
      (in manchester day6)
      (in manchester day7)

      ;; Bucharest requested 7 days -> require Bucharest on days 8..14
      (in bucharest day8)
      (in bucharest day9)
      (in bucharest day10)
      (in bucharest day11)
      (in bucharest day12)
      (in bucharest day13)
      (in bucharest day14)

      ;; Lyon requested 5 days -> require Lyon on days 13..17
      ;; This enforces the additional hard constraint that relatives in Lyon
      ;; must be visited during days 13..17 (here: the entire Lyon stay is pinned
      ;; to that window). This overlap with Bucharest is intentional to faithfully
      ;; represent the inconsistent original requests (7+7+5 = 19 > 17).
      (in lyon day13)
      (in lyon day14)
      (in lyon day15)
      (in lyon day16)
      (in lyon day17)

      ;; Travel/connectivity constraints enforced by requiring the two needed
      ;; flight actions to be executed on the correct departure days so the
      ;; solver cannot invent non-existent direct flights (Manchester->Lyon).
      ;; Require Manchester -> Bucharest flight to occur at the Manchester->Bucharest boundary.
      (travel-mb day7)

      ;; Require Bucharest -> Lyon flight to occur at the Bucharest->Lyon boundary.
      (travel-bl day14)

      ;; Ensure each required city has been visited (bookkeeping predicates).
      (visited manchester)
      (visited bucharest)
      (visited lyon)
    )
  )
)