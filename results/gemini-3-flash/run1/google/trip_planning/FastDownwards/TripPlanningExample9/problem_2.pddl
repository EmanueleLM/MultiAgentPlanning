(define (problem trip_planning_example_9)
    (:domain trip_planning)
    (:objects
        frankfurt bucharest stuttgart - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
        s0 s1 s2 s3 s4 s5 s6 - step
    )

    (:init
        (not_started)
        (is_day_1 d1)
        
        ;; Day sequence
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10)

        ;; Count sequence
        (next_step s0 s1) (next_step s1 s2) (next_step s2 s3)
        (next_step s3 s4) (next_step s4 s5) (next_step s5 s6)

        ;; Initial counts
        (count_frankfurt s0)
        (count_bucharest s0)
        (count_stuttgart s0)

        ;; Flight network
        (can_fly bucharest frankfurt)
        (can_fly frankfurt bucharest)
        (can_fly frankfurt stuttgart)
        (can_fly stuttgart frankfurt)
    )

    (:goal
        (and
            ;; Visit durations
            (count_frankfurt s3)
            (count_bucharest s3)
            (count_stuttgart s6)

            ;; Workshop constraint in Stuttgart between day 5 and 10
            (visited stuttgart d5)
            (visited stuttgart d6)
            (visited stuttgart d7)
            (visited stuttgart d8)
            (visited stuttgart d9)
            (visited stuttgart d10)

            ;; Trip must complete all 10 days
            (day_done d10)
        )
    )
)