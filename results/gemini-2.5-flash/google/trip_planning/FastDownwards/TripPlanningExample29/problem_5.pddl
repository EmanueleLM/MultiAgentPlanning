(define (problem trip_to_europe)
    (:domain trip_planning_example29)
    (:objects
        me - agent
        krakow dubrovnik frankfurt - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    )
    (:init
        (at me frankfurt)
        (current_day day1)
        (= (total-cost) 0)

        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9)
        (next_day day9 day10)

        (is_last_day day10)

        (connected frankfurt krakow)
        (connected krakow frankfurt)
        (connected dubrovnik frankfurt)
        (connected frankfurt dubrovnik)

        (has_been_to_city frankfurt)
    )
    (:goal (and
        (current_day day10) ; The plan must successfully reach the end of day 10
        (= (total-cost) 10) ; Exactly 10 days (actions) must be performed

        (day_spent_in_city me krakow day9) ; Mandatory stay in Krakow on day 9 for the wedding
        (day_spent_in_city me krakow day10) ; Mandatory stay in Krakow on day 10 for the wedding
        (has_stayed_at_city dubrovnik) ; Ensure at least one day was spent in Dubrovnik
        (has_stayed_at_city frankfurt) ; Ensure at least one day was spent in Frankfurt
    ))
)