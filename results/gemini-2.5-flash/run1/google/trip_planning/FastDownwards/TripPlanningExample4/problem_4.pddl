(define (problem trip_planning_example4)
    (:domain trip_planning_example4)
    (:init
        ; Initial trip day and location
        (current_trip_day trip_day_0) ; Trip starts before day 1 is spent
        (at_city seville) ; Deduced start city for solvability

        ; Next trip day relations (temporal stages)
        (next_trip_day trip_day_0 trip_day_1) (next_trip_day trip_day_1 trip_day_2)
        (next_trip_day trip_day_2 trip_day_3) (next_trip_day trip_day_3 trip_day_4)
        (next_trip_day trip_day_4 trip_day_5) (next_trip_day trip_day_5 trip_day_6)
        (next_trip_day trip_day_6 trip_day_7) (next_trip_day trip_day_7 trip_day_8)
        (next_trip_day trip_day_8 trip_day_9) (next_trip_day trip_day_9 trip_day_10)
        (next_trip_day trip_day_10 trip_day_11) (next_trip_day trip_day_11 trip_day_12)

        ; Next stay count relations (for incrementing duration counters)
        (next_stay_count stay_count_0 stay_count_1)
        (next_stay_count stay_count_1 stay_count_2)
        (next_stay_count stay_count_2 stay_count_3)
        (next_stay_count stay_count_3 stay_count_4)
        (next_stay_count stay_count_4 stay_count_5)
        (next_stay_count stay_count_5 stay_count_6)

        ; Direct flight connections
        (direct_flight seville munich)
        (direct_flight munich seville)
        (direct_flight munich tallinn)
        (direct_flight tallinn munich)

        ; Initial day counts for cities (0 days spent at the beginning of day 1)
        (days_in_seville stay_count_0)
        (days_in_munich stay_count_0)
        (days_in_tallinn stay_count_0)
    )
    (:goal (and
        (current_trip_day trip_day_12) ; The trip must end after day 12 is spent
        ; Derived duration goals, adjusted to sum to 12 days:
        (days_in_seville stay_count_6) ; Seville for 6 days (adjusted from 7)
        (days_in_munich stay_count_4)  ; Munich for 4 days (adjusted from 5)
        (days_in_tallinn stay_count_2) ; Tallinn for 2 days (as stated, fits meeting)
        (tallinn_meeting_held)        ; Ensure the meeting in Tallinn happened on Day 11 or 12
    ))
)