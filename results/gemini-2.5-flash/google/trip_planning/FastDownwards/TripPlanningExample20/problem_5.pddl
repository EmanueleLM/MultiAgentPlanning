(define (problem trip_planning_20_problem)
    (:domain trip_planning_20)
    (:objects
        istanbul budapest dubrovnik - city
        pday_0 pday_1 pday_2 pday_3 pday_4 pday_5 pday_6 pday_7 pday_8 pday_9 pday_10 pday_11 pday_12 - pday
        c0 c1 c2 c3 c4 c5 - day_count_level
    )
    (:init
        ; Initial location (Dubrovnik, changed from Istanbul to allow visiting all cities due to unidirectional flight D->I)
        (at dubrovnik)
        (visited dubrovnik) ; Mark initial city as visited

        ; Initial plan day and sequence for total trip duration (12 days)
        (current_position_in_plan pday_0)
        (next_position_in_plan pday_0 pday_1)
        (next_position_in_plan pday_1 pday_2)
        (next_position_in_plan pday_2 pday_3)
        (next_position_in_plan pday_3 pday_4)
        (next_position_in_plan pday_4 pday_5)
        (next_position_in_plan pday_5 pday_6)
        (next_position_in_plan pday_6 pday_7)
        (next_position_in_plan pday_7 pday_8)
        (next_position_in_plan pday_8 pday_9)
        (next_position_in_plan pday_9 pday_10)
        (next_position_in_plan pday_10 pday_11)
        (next_position_in_plan pday_11 pday_12)

        ; Initial day counts for cities (0 days spent)
        (days_spent_in istanbul c0)
        (days_spent_in budapest c0)
        (days_spent_in dubrovnik c0)

        ; Define target days to spend in each city (adjusted from 14 to 12 total days by the orchestrator)
        ; Original: Istanbul 5, Budapest 6, Dubrovnik 3. Total 14.
        ; Adjusted: Istanbul 4, Budapest 5, Dubrovnik 3. Total 12.
        (max_days_for_city istanbul c4)
        (max_days_for_city budapest c5)
        (max_days_for_city dubrovnik c3)

        ; Day count level sequence (allows counts up to c5, which is sufficient for Budapest's 5 days)
        (next_count_level c0 c1)
        (next_count_level c1 c2)
        (next_count_level c2 c3)
        (next_count_level c3 c4)
        (next_count_level c4 c5)

        ; Flight connections (bi-directional Istanbul-Budapest, uni-directional Dubrovnik-Istanbul)
        (connected istanbul budapest)
        (connected budapest istanbul)
        (connected dubrovnik istanbul)
    )
    (:goal (and
        ; All cities must be visited
        (visited istanbul)
        (visited budapest)
        (visited dubrovnik)

        ; Specific days must be spent in each city (adjusted targets)
        (days_spent_in istanbul c4)
        (days_spent_in budapest c5)
        (days_spent_in dubrovnik c3)

        ; Total trip duration must be exactly 12 days
        (current_position_in_plan pday_12)
    ))
)