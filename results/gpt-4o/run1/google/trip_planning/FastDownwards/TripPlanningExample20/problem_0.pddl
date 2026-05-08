(define (problem european_trip_instance)
    (:domain european_trip)
    (:objects
        istanbul budapest dubrovnik - city
        day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    )
    (:init
        (current_city istanbul)
        (visited_for istanbul day0)
        (available_flight istanbul budapest)
        (available_flight dubrovnik istanbul)
        (next_day day0 day1) (next_day day1 day2) (next_day day2 day3)
        (next_day day3 day4) (next_day day4 day5) (next_day day5 day6)
        (next_day day6 day7) (next_day day7 day8) (next_day day8 day9)
        (next_day day9 day10) (next_day day10 day11) (next_day day11 day12)
    )
    (:goal
        (trip_complete)
    )
)