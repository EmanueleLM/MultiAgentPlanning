(define (problem trip_planning_example_39_prob)
    (:domain trip_planning_example_39)
    (:objects
        porto barcelona florence - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
        c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count
    )
    (:init
        ;; Starting conditions
        (at_city porto)
        (current_day d1)
        (city_count porto c0)
        (city_count barcelona c0)
        (city_count florence c0)

        ;; Day sequence (12 days total, so trip ends at d13)
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5) (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)

        ;; Count sequence
        (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4) (next_count c4 c5) (next_count c5 c6) (next_count c6 c7) (next_count c7 c8) (next_count c8 c9) (next_count c9 c10) (next_count c10 c11) (next_count c11 c12)

        ;; Flight connections
        (can_fly porto barcelona) (can_fly barcelona porto)
        (can_fly barcelona florence) (can_fly florence barcelona)
    )
    (:goal
        (and
            ;; Complete trip after 12 days
            (current_day d13)

            ;; Stays satisfied
            (city_count porto c3)
            (city_count barcelona c7)
            (city_count florence c4)

            ;; Relative visit constraint: porto days 1, 2, and 3
            (day_visited porto d1)
            (day_visited porto d2)
            (day_visited porto d3)
        )
    )
)