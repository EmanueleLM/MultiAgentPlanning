(define (problem trip_plan)
    (:domain european_trip)
    (:objects
        oslo porto dubrovnik - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    )
    (:init
        (in_city oslo day1)
        (flight_available oslo dubrovnik)
        (flight_available porto oslo)
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9)
        (next_day day9 day10)
        (next_day day10 day11)
        (next_day day11 day12)
        (next_day day12 day13)
        (next_day day13 day14)
        (next_day day14 day15)
        (next_day day15 day16)
        (attendance_required dubrovnik day12)
        (attendance_required dubrovnik day16)
    )
    (:goal (and
        (in_city oslo day6)   ; Stay in Oslo until day 6
        (in_city porto day13) ; Continue the stay in Porto for 7 days until day 13 
        (in_city dubrovnik day12) 
        (in_city dubrovnik day16)
    ))
)