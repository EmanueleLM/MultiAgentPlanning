(define (problem european_trip_instance)
    (:domain european_trip)
    (:objects
        istanbul budapest dubrovnik - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    )
    (:init
        (current_city istanbul)
        (day day1)
        (available_flight istanbul budapest)
        (available_flight budapest istanbul)
        (available_flight dubrovnik istanbul)
    )
    (:goal
        (goal_reached)
    )
)