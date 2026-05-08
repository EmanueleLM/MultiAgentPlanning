(define (problem trip_planning_example_38)
    (:domain trip_planning)
    (:objects
        geneva madrid venice - city
        day1 day2 day3 day4 day5 day_end - day
    )
    (:init
        (at geneva)
        (current_day day1)

        ; Temporal sequence
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day_end)

        ; Specific day markers for conference
        (is_day4 day4)
        (is_day5 day5)

        ; Flight connections (bidirectional)
        (is_flight geneva madrid)
        (is_flight madrid geneva)
        (is_flight madrid venice)
        (is_flight venice madrid)

        ; Initial day counts for cities
        (days_in_venice_is_0)
        (days_in_geneva_is_0)
        (days_in_madrid_is_0)
    )
    (:goal (and
        (current_day day_end)
        (days_in_venice_is_2)
        (days_in_geneva_is_2)
        (days_in_madrid_is_3)
        (conference_day4_attended)
        (conference_day5_attended)
    ))
)