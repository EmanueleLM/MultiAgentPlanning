(define (problem trip_planning_example_30)
    (:domain trip_planning)
    (:objects
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
        c0 c1 c2 c3 c4 c5 c6 c7 - count
    )
    (:init
        ;; Start at Zurich on Day 1
        (at zurich)
        (current_day d1)
        (city_count zurich c1)
        (city_count istanbul c0)
        (city_count tallinn c0)

        ;; Day sequence
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 d14)

        ;; Count sequence
        (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
        (next_count c4 c5) (next_count c5 c6) (next_count c6 c7)

        ;; Direct flight connections (All cities are connected)
        (can_fly istanbul tallinn) (can_fly tallinn istanbul)
        (can_fly istanbul zurich) (can_fly zurich istanbul)
        (can_fly tallinn zurich) (can_fly zurich tallinn)

        ;; Zurich Show constraints (Day 1 to 7)
        (is_show_day d1) (is_show_day d2) (is_show_day d3) (is_show_day d4)
        (is_show_day d5) (is_show_day d6) (is_show_day d7)
    )
    (:goal
        (and
            (city_count istanbul c5)
            (city_count tallinn c4)
            (city_count zurich c7)
            (attended_show)
            (current_day d14)
        )
    )
)