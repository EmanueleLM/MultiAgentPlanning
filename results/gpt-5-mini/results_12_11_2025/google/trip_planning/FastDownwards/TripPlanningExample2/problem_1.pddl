(define (problem trip-plan)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    Reykjavik Vienna Venice - city
    r1 r2 v1 v2 v3 v4 v5 ve1 ve2 ve3 ve4 - token
  )

  (:init
    ; initial assignment per audited plan: day1 is Reykjavik and already assigned
    (at day1 Reykjavik)
    (assigned day1)

    ; token usage: r1 is already consumed to account for day1 = Reykjavik
    (used r1)

    ; available tokens for remaining 10 days (tokens indicate available slots for each city)
    (token r2 Reykjavik)
    (token v1 Vienna)
    (token v2 Vienna)
    (token v3 Vienna)
    (token v4 Vienna)
    (token v5 Vienna)
    (token ve1 Venice)
    (token ve2 Venice)
    (token ve3 Venice)
    (token ve4 Venice)

    ; day adjacency (consecutive days)
    (day-next day1 day2)
    (day-next day2 day3)
    (day-next day3 day4)
    (day-next day4 day5)
    (day-next day5 day6)
    (day-next day6 day7)
    (day-next day7 day8)
    (day-next day8 day9)
    (day-next day9 day10)
    (day-next day10 day11)

    ; connectivity: direct flights and staying allowed (self loops)
    ; allowed moves: Reykjavik <-> Vienna, Vienna <-> Venice, and staying in same city
    (connected Reykjavik Reykjavik)
    (connected Vienna Vienna)
    (connected Venice Venice)

    (connected Reykjavik Vienna)
    (connected Vienna Reykjavik)

    (connected Vienna Venice)
    (connected Venice Vienna)

    ; mark Venice object for action selection
    (is-venice Venice)

    ; wedding window days: days 8..11 inclusive
    (window-day day8)
    (window-day day9)
    (window-day day10)
    (window-day day11)
  )

  (:goal (and
    ; every day must be assigned
    (assigned day1)
    (assigned day2)
    (assigned day3)
    (assigned day4)
    (assigned day5)
    (assigned day6)
    (assigned day7)
    (assigned day8)
    (assigned day9)
    (assigned day10)
    (assigned day11)

    ; all city-day tokens must be used (enforces the finalized per-city counts:
    ; Reykjavik 2 (r1,r2), Vienna 5 (v1..v5), Venice 4 (ve1..ve4))
    (used r1)
    (used r2)
    (used v1)
    (used v2)
    (used v3)
    (used v4)
    (used v5)
    (used ve1)
    (used ve2)
    (used ve3)
    (used ve4)

    ; at least one window day assigned to Venice (enforced by requiring the wedding flag)
    (wedding-satisfied)
  ))
)