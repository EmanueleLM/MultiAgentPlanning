(define (problem trip_planning_example45)
    (:domain trip_planning_domain)
    (:objects
        jack_of_all_trades - person
        copenhagen lisbon florence - city
        day_0 day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day_stage
        count_0 count_1 count_2 count_3 count_4 count_5 count_6 count_7 - day_count_state
    )
    (:init
        (at jack_of_all_trades copenhagen) ; Starting city, inferred for conference on day 1
        (current_day_stage day_0)

        ; Day stage progression
        (next_day_stage day_0 day_1)
        (next_day_stage day_1 day_2)
        (next_day_stage day_2 day_3)
        (next_day_stage day_3 day_4)
        (next_day_stage day_4 day_5)
        (next_day_stage day_5 day_6)
        (next_day_stage day_6 day_7)
        (next_day_stage day_7 day_8)
        (next_day_stage day_8 day_9)
        (next_day_stage day_9 day_10)
        (next_day_stage day_10 day_11)
        (next_day_stage day_11 day_12)
        (next_day_stage day_12 day_13)
        (next_day_stage day_13 day_14)
        (next_day_stage day_14 day_15)
        (next_day_stage day_15 day_16)

        ; Day count state progression
        (next_count_state count_0 count_1)
        (next_count_state count_1 count_2)
        (next_count_state count_2 count_3)
        (next_count_state count_3 count_4)
        (next_count_state count_4 count_5)
        (next_count_state count_5 count_6)
        (next_count_state count_6 count_7)

        ; Direct flights (assuming bidirectional based on common travel scenarios)
        (direct_flight copenhagen lisbon)
        (direct_flight lisbon copenhagen)
        (direct_flight lisbon florence)
        (direct_flight florence lisbon)

        ; Initial days spent in cities
        (days_spent_in_city jack_of_all_trades copenhagen count_0)
        (days_spent_in_city jack_of_all_trades lisbon count_0)
        (days_spent_in_city jack_of_all_trades florence count_0)

        ; Conference days
        (conference_day_at day_1 copenhagen)
        (conference_day_at day_7 copenhagen)

        (= (total-cost) 0)
    )
    (:goal (and
        (current_day_stage day_16)
        (days_spent_in_city jack_of_all_trades lisbon count_7)
        (days_spent_in_city jack_of_all_trades florence count_4)
        (days_spent_in_city jack_of_all_trades copenhagen count_7)
    ))
    (:metric minimize (total-cost))
)