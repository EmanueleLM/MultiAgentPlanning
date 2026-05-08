(define (problem trip_planning_example_25)
    (:domain trip_planning)
    (:objects
        city_valencia city_split city_lyon - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_end - day
        s0 s1 s2 s3 s4 s5 s6 s7 - stay_count_num
    )

    (:init
        ; Initial location and day
        (at city_valencia) ; Starting city, as none explicitly specified. Valencia has direct flights.
        (current_day day_1)

        ; Day sequencing
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
        (next_day day_13 day_14)
        (next_day day_14 day_15)
        (next_day day_15 day_16)
        (next_day day_16 day_end) ; Marks the end of the 16-day trip

        ; Direct flight connections (symmetric)
        (direct_flight city_lyon city_split)
        (direct_flight city_split city_lyon)
        (direct_flight city_valencia city_lyon)
        (direct_flight city_lyon city_valencia)

        ; Initial stay counts for each city (generalized predicate)
        (city_stays city_valencia s0)
        (city_stays city_lyon s0)
        (city_stays city_split s0)

        ; Stay count sequencing for incremental updates
        (next_stay_count s0 s1)
        (next_stay_count s1 s2)
        (next_stay_count s2 s3)
        (next_stay_count s3 s4)
        (next_stay_count s4 s5)
        (next_stay_count s5 s6)
        (next_stay_count s6 s7)
    )

    (:goal (and
        (current_day day_end) ; Ensures the trip spans exactly 16 days

        ; Mandated Split show attendance (continuous from Day 10 to Day 16)
        (stayed_on_day city_split day_10)
        (stayed_on_day city_split day_11)
        (stayed_on_day city_split day_12)
        (stayed_on_day city_split day_13)
        (stayed_on_day city_split day_14)
        (stayed_on_day city_split day_15)
        (stayed_on_day city_split day_16)

        ; Adjusted total stay durations for other cities
        ; Original requested: Valencia (5 days), Split (7 days), Lyon (6 days). Total 18 days.
        ; Total budget: 16 days.
        ; Split D10-D16 is mandatory (7 days).
        ; Remaining budget for Valencia/Lyon: 16 - 7 = 9 days.
        ; Remaining requested for Valencia/Lyon: 5 + 6 = 11 days.
        ; Need to reduce 2 days. Minimizing deviation means -1 day from Valencia, -1 day from Lyon.
        ; Adjusted: Valencia (4 days), Lyon (5 days), Split (7 days). Total 16 days.
        (city_stays city_valencia s4)
        (city_stays city_lyon s5)
        (city_stays city_split s7)
    ))
)