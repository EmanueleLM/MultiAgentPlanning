(define (problem trip_planning_example_40)
    (:domain trip_planning_example_40)
    (:objects
        oslo reykjavik manchester - city
        day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
        od0 od1 od2 od3 od4 od5 od6 - oslo_day_count
        rd0 rd1 rd2 - reykjavik_day_count
        md0 md1 md2 - manchester_day_count
    )
    (:init
        ; Initial location (assumed to be oslo, as starting city is not specified)
        (at oslo)
        ; Current day
        (current_day day1)

        ; Next day relations
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)
        (next_day day8 day9) ; Day 9 is the day after the trip ends (day 8 is the last day)

        ; Flight availability
        (flight_available oslo reykjavik)
        (flight_available reykjavik oslo)
        (flight_available manchester oslo)
        (flight_available oslo manchester)

        ; Wedding specific
        (wedding_day day2) ; Wedding is "between day 1 and day 2", interpreted as on day 2

        ; Initial day counts
        (current_oslo_days od0)
        (current_reykjavik_days rd0)
        (current_manchester_days md0)

        ; Next oslo day count relations
        (next_oslo_day_count od0 od1)
        (next_oslo_day_count od1 od2)
        (next_oslo_day_count od2 od3)
        (next_oslo_day_count od3 od4)
        (next_oslo_day_count od4 od5)
        (next_oslo_day_count od5 od6)

        ; Next reykjavik day count relations
        (next_reykjavik_day_count rd0 rd1)
        (next_reykjavik_day_count rd1 rd2)

        ; Next manchester day count relations
        (next_manchester_day_count md0 md1)
        (next_manchester_day_count md1 md2)
    )
    (:goal (and
        (current_day day9) ; Ensure 8 days have passed
        (has_attended_wedding)
        (current_oslo_days od6) ; Desired 6 days in Oslo
        (current_reykjavik_days rd2) ; Desired 2 days in Reykjavik
        (current_manchester_days md2) ; Desired 2 days in Manchester
    ))
)