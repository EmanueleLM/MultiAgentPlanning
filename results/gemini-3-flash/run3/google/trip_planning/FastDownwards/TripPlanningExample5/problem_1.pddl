(define (problem trip_planning_example_5_prob)
    (:domain trip_planning_example_5)
    (:objects
        porto oslo dubrovnik - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 - count_val
    )
    (:init
        ;; Flight connections
        (connected porto oslo)
        (connected oslo porto)
        (connected oslo dubrovnik)
        (connected dubrovnik oslo)

        ;; Day sequence
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)

        ;; Count sequence
        (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
        (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
        (next_count n8 n9) (next_count n9 n10) (next_count n10 n11) (next_count n11 n12)
        (next_count n12 n13) (next_count n13 n14) (next_count n14 n15) (next_count n15 n16)

        ;; Starting state
        (at porto)
        (current_day d1)
        (city_count porto n0)
        (city_count oslo n0)
        (city_count dubrovnik n0)
    )
    (:goal (and
        ;; Final trip duration constraint (16 days passed)
        (current_day d17)
        
        ;; Specific city stay requirements (total counts)
        (city_count porto n7)
        (city_count oslo n6)
        (city_count dubrovnik n5)

        ;; Conference constraints
        (stayed dubrovnik d12)
        (stayed dubrovnik d16)
    ))
)