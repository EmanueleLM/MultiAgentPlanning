(define (problem trip_planning_example_25_prob)
        (:domain trip_planning_example_25)
        (:objects
            valencia lyon split - city
            d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
            n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 - count
        )
        (:init
            (at valencia)
            (current_day d1)
            (city_count valencia n0)
            (city_count lyon n0)
            (city_count split n0)
            
            (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
            (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
            (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
            (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)
            
            (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
            (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
            (next_count n8 n9) (next_count n9 n10) (next_count n10 n11) (next_count n11 n12)
            (next_count n12 n13) (next_count n13 n14) (next_count n14 n15) (next_count n15 n16)
            
            (has_flight valencia lyon) (has_flight lyon valencia)
            (has_flight lyon split) (has_flight split lyon)
        )
        (:goal (and
            (city_count valencia n5)
            (city_count lyon n6)
            (city_count split n7)
            (visited split d10)
            (visited split d11)
            (visited split d12)
            (visited split d13)
            (visited split d14)
            (visited split d15)
            (visited split d16)
            (current_day d17)
        ))
    )