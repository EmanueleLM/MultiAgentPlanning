(define (problem trip_planning_example1_instance)
    (:domain trip_planning_example1)
    (:objects
        riga manchester split - city
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day_index
        r0_level r1_level r2_level r3_level r4_level r5_level r6_level r7_level - count_level_riga
        m0_level m1_level m2_level m3_level m4_level - count_level_manchester
        s0_level s1_level s2_level s3_level s4_level s5_level s6_level - count_level_split
    )
    (:init
        ;; Initial day and city counts
        (current_day d0)
        (days_in_riga_is r0_level)
        (days_in_manchester_is m0_level)
        (days_in_split_is s0_level)
        (not_at_any_city)

        ;; Day progression
        (next_day d0 d1) (next_day d1 d2) (next_day d2 d3) (next_day d3 d4)
        (next_day d4 d5) (next_day d5 d6) (next_day d6 d7) (next_day d7 d8)
        (next_day d8 d9) (next_day d9 d10) (next_day d10 d11) (next_day d11 d12)
        (next_day d12 d13) (next_day d13 d14) (next_day d14 d15)

        ;; Riga day count progression (max 7 days)
        (next_riga_level r0_level r1_level)
        (next_riga_level r1_level r2_level)
        (next_riga_level r2_level r3_level)
        (next_riga_level r3_level r4_level)
        (next_riga_level r4_level r5_level)
        (next_riga_level r5_level r6_level)
        (next_riga_level r6_level r7_level)

        ;; Manchester day count progression (max 4 days)
        (next_manchester_level m0_level m1_level)
        (next_manchester_level m1_level m2_level)
        (next_manchester_level m2_level m3_level)
        (next_manchester_level m3_level m4_level)

        ;; Split day count progression (max 6 days)
        (next_split_level s0_level s1_level)
        (next_split_level s1_level s2_level)
        (next_split_level s2_level s3_level)
        (next_split_level s3_level s4_level)
        (next_split_level s4_level s5_level)
        (next_split_level s5_level s6_level)

        ;; Direct flight connections
        (direct_flight riga manchester)
        (direct_flight manchester riga)
        (direct_flight manchester split)
    )
    (:goal (and
        (current_day d15)
        (visited riga)
        (visited manchester)
        (visited split)
    ))
)