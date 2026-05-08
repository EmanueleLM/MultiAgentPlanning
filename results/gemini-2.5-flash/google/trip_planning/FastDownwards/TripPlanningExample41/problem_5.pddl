(define (problem trip_planning_example41_problem)
    (:domain trip_planning_example41)
    (:objects
        stockholm athens mykonos - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_end - day
        s0 s1 s2 s3 s4 s5 s6 - day_counter_s
        a0 a1 a2 a3 a4 a5 - day_counter_a
        m0 m1 m2 m3 m4 - day_counter_m
    )
    (:init
        (current_day day_1)
        (at_city stockholm)

        (next_day day_1 day_2)
        (next_day day_2 day_3)
        (next_day day_3 day_4)
        (next_day day_4 day_5)
        (next_day day_5 day_6)
        (next_day day_6 day_7)
        (next_day day_7 day_8)
        (next_day day_8 day_9)
        (next_day day_9 day_10)
        (next_day day_10 day_11)
        (next_day day_11 day_12)
        (next_day day_12 day_13)
        (next_day day_13 day_end)

        (direct_flight athens mykonos)
        (direct_flight mykonos athens)
        (direct_flight stockholm athens)
        (direct_flight athens stockholm)

        (conference_on_day day_1)
        (conference_on_day day_6)

        (stockholm_days_spent s0)
        (athens_days_spent a0)
        (mykonos_days_spent m0)

        (next_s_count s0 s1)
        (next_s_count s1 s2)
        (next_s_count s2 s3)
        (next_s_count s3 s4)
        (next_s_count s4 s5)
        (next_s_count s5 s6)

        (next_a_count a0 a1)
        (next_a_count a1 a2)
        (next_a_count a2 a3)
        (next_a_count a3 a4)
        (next_a_count a4 a5)

        (next_m_count m0 m1)
        (next_m_count m1 m2)
        (next_m_count m2 m3)
        (next_m_count m3 m4)
    )
    (:goal
        (and
            (current_day day_end)
            (stockholm_days_spent s6)
            (athens_days_spent a5)
            (mykonos_days_spent m4)
        )
    )
)