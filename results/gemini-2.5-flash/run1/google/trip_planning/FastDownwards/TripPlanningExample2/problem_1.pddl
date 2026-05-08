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
        (next_day day11 day12) ; Goal is to reach day12

        ; Initial day counts for cities
        (reykjavik_spent_0_days)
        (vienna_spent_0_days)
        (venice_spent_0_days)
    )
    (:goal (and
        (current_day day12)
        (reykjavik_spent_2_days)
        (vienna_spent_7_days)
        (venice_spent_4_days)
        (wedding_attended)
    ))
)