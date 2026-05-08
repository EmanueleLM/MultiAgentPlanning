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
        (= (total-cost) 0) ; Initialize the total-cost fluent

        ;; Define the sequence of days for the 10-day trip
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9)
        (next_day day9 day10)

        ;; Mark day10 as the last day to be used by spend_last_day_in_city action
        (is_last_day day10)

        ;; Define direct flight connections
        (connected frankfurt krakow)
        (connected krakow frankfurt)
        (connected dubrovnik frankfurt)
        (connected frankfurt dubrovnik)

        ;; The agent starts in Frankfurt, so it's considered visited
        (visited_city frankfurt)
    )
    (:goal (and
        (current_day day10) ; The plan must successfully reach the end of day 10
        (day_spent_in_city me krakow day9) ; Mandatory stay in Krakow on day 9 for the wedding
        (day_spent_in_city me krakow day10) ; Mandatory stay in Krakow on day 10 for the wedding
        (visited_city krakow) ; Ensure Krakow is visited
        (visited_city dubrovnik) ; Ensure Dubrovnik is visited
        (visited_city frankfurt) ; Ensure Frankfurt is visited
    ))
)