(define (problem trip_planning_example_38)
    (:domain trip_planning)
    (:objects
        geneva madrid venice - city
        day1 day2 day3 day4 day5 day_end - day
    )
    (:init
        (at geneva) ; Assuming starting point based on first city mentioned in flights
        (current_day day1)

        ; Temporal sequence
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day_end)

        ; Flight connections (bidirectional)
        (is_flight geneva madrid)
        (is_flight madrid geneva)
        (is_flight madrid venice)
        (is_flight venice madrid)

        ; Initial day counts for cities
        (venice_days_spent_0)
        (geneva_days_spent_0)
        (madrid_days_spent_0)
    )
    (:goal (and
        (current_day day_end)
        (venice_days_spent_2)
        (geneva_days_spent_2)
        (madrid_days_spent_3)
        (conference_day4_attended)
        (conference_day5_attended)
    ))
)