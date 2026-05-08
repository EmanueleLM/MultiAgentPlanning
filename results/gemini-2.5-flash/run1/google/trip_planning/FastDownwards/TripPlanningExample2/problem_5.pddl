(define (problem tripplanningexample2)
    (:domain trip_planning)
    (:objects
        reykjavik vienna venice - city
        day01 day02 day03 day04 day05 day06 day07 day08 day09 day10 day11 day12 - day
    )
    (:init
        ; Initial day
        (current_day day01)
        ; Start at an arbitrary city, as problem does not specify initial location
        (at_city reykjavik)

        ; Flight connections (symmetric as per "direct flights")
        (has_flight reykjavik vienna)
        (has_flight vienna reykjavik)
        (has_flight vienna venice)
        (has_flight venice vienna)

        ; Day sequence for 11 days (day01 to day11, transition to day12 marks end)
        (next_day day01 day02)
        (next_day day02 day03)
        (next_day day03 day04)
        (next_day day04 day05)
        (next_day day05 day06)
        (next_day day06 day07)
        (next_day day07 day08)
        (next_day day08 day09)
        (next_day day09 day10)
        (next_day day10 day11)
        (next_day day11 day12)

        ; Initial day counts for cities
        (reykjavik_spent_0_days)
        (vienna_spent_0_days)
        (venice_spent_0_days)

        ; Mark wedding days (Day 8 to Day 11 inclusive)
        (wedding_day day08)
        (wedding_day day09)
        (wedding_day day10)
        (wedding_day day11)
        
        ; Wedding not yet attended (by default, if not in init)
    )
    (:goal (and
        (current_day day12) ; The trip must conclude after 11 days
        (wedding_attended)  ; The wedding must be attended (prioritized constraint)
        ; Note: Specific city duration goals (Reykjavik 2, Vienna 7, Venice 4 days) are
        ; omitted from the goal due to the detected inconsistency (13 required days vs 11 allowed),
        ; prioritizing the total duration and wedding as per orchestrator's directive.
    ))
)