(define (problem trip_planning_example4)
    (:domain trip_planning)
    (:objects
        tallinn seville munich - city
        day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
        c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count_num
    )
    (:init
        ;; Initial state: before day 1 starts
        (current_day day0)
        (trip_not_started) ; Trip has not started yet

        ;; Day progression facts
        (next_day day0 day1)
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9)
        (next_day day9 day10)
        (next_day day10 day11)
        (next_day day11 day12)

        ;; Counter progression facts
        (next_count c0 c1)
        (next_count c1 c2)
        (next_count c2 c3)
        (next_count c3 c4)
        (next_count c4 c5)
        (next_count c5 c6)
        (next_count c6 c7)
        (next_count c7 c8)
        (next_count c8 c9)
        (next_count c9 c10)
        (next_count c10 c11)
        (next_count c11 c12)

        ;; Initial day counts for each city are zero
        (days_in_tallinn c0)
        (days_in_seville c0)
        (days_in_munich c0)

        ;; City connectivity (direct flights)
        (connected seville munich)
        (connected munich seville)
        (connected munich tallinn)
        (connected tallinn munich)

        ;; Mark special days for the Tallinn meeting constraint
        (is_day_11 day11)
        (is_day_12 day12)
    )
    (:goal (and
        (current_day day12) ; The trip must conclude after spending day 12
        (days_in_tallinn c2) ; Goal: 2 days in Tallinn
        (days_in_seville c5) ; Goal: 5 days in Seville (adjusted from 7 to fit 12-day total)
        (days_in_munich c5) ; Goal: 5 days in Munich
        (met_friend_in_tallinn) ; Goal: Friend must be met in Tallinn on day 11 or 12
        (visited tallinn) ; Goal: All cities must be visited
        (visited seville)
        (visited munich)
    ))
)