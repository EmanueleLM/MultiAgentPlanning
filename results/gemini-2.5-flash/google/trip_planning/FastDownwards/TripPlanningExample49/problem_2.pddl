(define (problem trip_planning_example49)
    (:domain trip_planning_example49)
    (:objects
        traveler - person
        reykjavik milan split - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
        r0 r1 r2 r3 r4 r5 - reykjavik_day_count
        m0 m1 m2 m3 m4 m5 m6 m7 - milan_day_count
        s0 s1 s2 s3 - split_day_count
    )
    (:init
        (at traveler milan)
        (current_day day_1)

        (days_in_reykjavik r0)
        (days_in_milan m0)
        (days_in_split s0)

        (connected milan reykjavik)
        (connected reykjavik milan)
        (connected split milan)
        (connected milan split)

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

        (next_reykjavik_count r0 r1)
        (next_reykjavik_count r1 r2)
        (next_reykjavik_count r2 r3)
        (next_reykjavik_count r3 r4)
        (next_reykjavik_count r4 r5)

        (next_milan_count m0 m1)
        (next_milan_count m1 m2)
        (next_milan_count m2 m3)
        (next_milan_count m3 m4)
        (next_milan_count m4 m5)
        (next_milan_count m5 m6)
        (next_milan_count m6 m7)

        (next_split_count s0 s1)
        (next_split_count s1 s2)
        (next_split_count s2 s3)

        (is_reykjavik_city reykjavik)
        (is_milan_city milan)
        (is_split_city split)
    )
    (:goal (and
        (current_day day_13)
        (days_in_reykjavik r5)
        (days_in_milan m7)
        (days_in_split s3)
        (visited_city_on_day split day_1)
        (visited_city_on_day split day_2)
        (visited_city_on_day split day_3)
    ))
)