(define (problem trip_planning_20_problem)
    (:domain trip_planning_20)
    (:objects
        istanbul budapest dubrovnik - city
        pday_0 pday_1 pday_2 pday_3 pday_4 pday_5 pday_6 pday_7 pday_8 pday_9 pday_10 pday_11 pday_12 - pday
        c0 c1 c2 c3 c4 c5 - day_count_level
    )
    (:init
        ; Initial location (arbitrarily choose Istanbul as no start is specified)
        (at istanbul)

        ; Initial plan day
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

        ; Initial day counts for cities
        (days_spent_in_istanbul c0)
        (days_spent_in_budapest c0)
        (days_spent_in_dubrovnik c0)

        ; Day count level sequence
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
        (visited istanbul)
        (visited budapest)
        (visited dubrovnik)
        (days_spent_in_istanbul c4) ; Adjusted target: 4 days
        (days_spent_in_budapest c5) ; Adjusted target: 5 days
        (days_spent_in_dubrovnik c3) ; Adjusted target: 3 days
        (current_position_in_plan pday_12) ; Total trip duration must be 12 days
    ))
)