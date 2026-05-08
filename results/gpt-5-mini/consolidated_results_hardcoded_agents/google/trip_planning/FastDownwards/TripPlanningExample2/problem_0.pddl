(define (problem trip-11days)
  (:domain travel)
  (:objects
    reykjavik vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Start: earliest-feasible preference — start in Reykjavik on day1
    (at reykjavik day1)

    ;; Direct flight connections (only these are allowed)
    (connected reykjavik vienna)
    (connected vienna reykjavik)
    (connected vienna venice)
    (connected venice vienna)

    ;; Day ordering (to allow actions to advance day -> next day)
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
  )

  ;; Hard constraints (agent preferences treated as hard):
  ;; - Reykjavik: 2 days
  ;; - Vienna: 7 days
  ;; - Venice: 4 days (and wedding must be attended sometime day8..day11)
  ;; These are encoded as required at(...) facts for specific days.
  ;; Note: these requirements together demand 13 city-days on an 11-day horizon -> unsatisfiable.
  (:goal (and
    ;; Ensure wedding attendance (must be set by one of the attend-wedding actions)
    (attended-wedding)

    ;; Reykjavik requested stay: 2 days (earliest assignment: day1, day2)
    (at reykjavik day1)
    (at reykjavik day2)

    ;; Vienna requested stay: 7 days (earliest contiguous assignment after Reykjavik)
    (at vienna day3)
    (at vienna day4)
    (at vienna day5)
    (at vienna day6)
    (at vienna day7)
    (at vienna day8)
    (at vienna day9)

    ;; Venice requested stay: 4 days — and wedding between day8 and day11.
    ;; The earliest 4-day block that satisfies wedding-window is day8..day11, so we require presence there.
    (at venice day8)
    (at venice day9)
    (at venice day10)
    (at venice day11)
  ))
)