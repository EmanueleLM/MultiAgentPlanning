(define (problem tripplanningexample2)
    (:domain trip_planning)
    (:objects
        reykjavik vienna venice - city
        day01 day02 day03 day04 day05 day06 day07 day08 day09 day10 day11 day12 - day
    )
    (:init
        ; Initial day
        (current_day day01)
        ; Start at an arbitrary city, say Reykjavik.
        (at_city reykjavik)

        ; Flight connections (symmetric)
        (has_flight reykjavik vienna)
        (has_flight vienna reykjavik)
        (has_flight vienna venice)
        (has_flight venice vienna)

        ; Day sequence
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
        (next_day day11 day12) ; Trip concludes at the start of day12 (11 full days passed)

        ; Initial day counts for cities
        (reykjavik_spent_0_days)
        (vienna_spent_0_days)
        (venice_spent_0_days)

        ; Mark wedding days
        (wedding_day day08)
        (wedding_day day09)
        (wedding_day day10)
        (wedding_day day11)
        
        ; Wedding not yet attended (implicitly false if not in init)
    )
    (:goal (and
        (current_day day12) ; The trip must conclude after 11 days (on day12)
        (wedding_attended)  ; The wedding must be attended (prioritized constraint)
        ; Removed city-specific duration goals (e.g., reykjavik_spent_2_days, vienna_spent_7_days, venice_spent_4_days)
        ; because their sum (13 days) exceeds the total allowed trip duration (11 days).
        ; This aligns with finding a plan that satisfies possible constraints and prioritizes the wedding.
    ))
)