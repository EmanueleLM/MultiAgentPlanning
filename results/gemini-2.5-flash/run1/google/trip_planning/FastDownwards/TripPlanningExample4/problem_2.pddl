(define (problem trip_planning_example4_repaired)
    (:domain trip_planning_repaired)
    (:objects
        seville munich tallinn - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
        day_count_0 day_count_1 day_count_2 day_count_3 day_count_4 day_count_5 day_count_6 - day_count
    )
    (:init
        ; Initial day and location
        (is_current_day day_1)
        (at_city seville) ; Deduced start city for solvability

        ; Next day relations (temporal stages)
        (next_day day_1 day_2) (next_day day_2 day_3) (next_day day_3 day_4) (next_day day_4 day_5)
        (next_day day_5 day_6) (next_day day_6 day_7) (next_day day_7 day_8) (next_day day_8 day_9)
        (next_day day_9 day_10) (next_day day_10 day_11) (next_day day_11 day_12)

        ; Next day count relations (for incrementing duration counters)
        (next_day_count day_count_0 day_count_1)
        (next_day_count day_count_1 day_count_2)
        (next_day_count day_count_2 day_count_3)
        (next_day_count day_count_3 day_count_4)
        (next_day_count day_count_4 day_count_5)
        (next_day_count day_count_5 day_count_6)

        ; Direct flight connections
        (direct_flight seville munich)
        (direct_flight munich seville)
        (direct_flight munich tallinn)
        (direct_flight tallinn munich)

        ; Initial day counts for cities (0 days spent at the beginning of day 1)
        (days_in_seville day_count_0)
        (days_in_munich day_count_0)
        (days_in_tallinn day_count_0)
    )
    (:goal (and
        (is_current_day day_12) ; The trip must end on day 12
        ; Derived duration goals, adjusted to sum to 12 days:
        (days_in_seville day_count_6) ; Seville for 6 days (adjusted from 7)
        (days_in_munich day_count_4)  ; Munich for 4 days (adjusted from 5)
        (days_in_tallinn day_count_2) ; Tallinn for 2 days (as stated, fits meeting)
        (tallinn_meeting_held)        ; Ensure the meeting in Tallinn happened on Day 11 or 12
    ))
)