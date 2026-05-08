(define (problem trip_planning_example_14)
    (:domain trip_planning_example_14)
    (:objects
        lyon frankfurt krakow - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
        ; Day count objects for Lyon (target 3 days, as reconciled)
        dc_l0 dc_l1 dc_l2 dc_l3 - day_count_lyon
        ; Day count objects for Frankfurt (target 2 days, as reconciled)
        dc_f0 dc_f1 dc_f2 - day_count_frankfurt
        ; Day count objects for Krakow (target 3 days, as reconciled)
        dc_k0 dc_k1 dc_k2 dc_k3 - day_count_krakow
    )
    (:init
        (at lyon) ; Assuming the trip starts in Lyon based on the derived schedule
        (current_day day1)

        ; Define sequence of days
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9)
        (next_day day9 day10)
        (next_day day10 day11) ; day11 signifies the end of day10, completing the 10-day trip

        ; Define direct flight connections
        (is_flight_connected lyon frankfurt)
        (is_flight_connected frankfurt lyon)
        (is_flight_connected frankfurt krakow)
        (is_flight_connected krakow frankfurt)

        ; Initialize day counts for each city
        (num_days_spent_lyon dc_l0)
        (next_lyon_day_count dc_l0 dc_l1)
        (next_lyon_day_count dc_l1 dc_l2)
        (next_lyon_day_count dc_l2 dc_l3)

        (num_days_spent_frankfurt dc_f0)
        (next_frankfurt_day_count dc_f0 dc_f1)
        (next_frankfurt_day_count dc_f1 dc_f2)

        (num_days_spent_krakow dc_k0)
        (next_krakow_day_count dc_k0 dc_k1)
        (next_krakow_day_count dc_k1 dc_k2)
        (next_krakow_day_count dc_k2 dc_k3)
    )
    (:goal (and
        (current_day day11) ; The trip must span exactly 10 days (from day1 to day10)

        ; Ensure the reconciled number of stay days for each city
        (num_days_spent_lyon dc_l3) ; 3 stay days in Lyon (reconciled from 7)
        (num_days_spent_frankfurt dc_f2) ; 2 stay days in Frankfurt (kept from 2)
        (num_days_spent_krakow dc_k3) ; 3 stay days in Krakow (kept from 3)

        ; Ensure Krakow attendance is mandatory from Day 8 to Day 10
        (stayed_in krakow day8)
        (stayed_in krakow day9)
        (stayed_in krakow day10)
    ))
)