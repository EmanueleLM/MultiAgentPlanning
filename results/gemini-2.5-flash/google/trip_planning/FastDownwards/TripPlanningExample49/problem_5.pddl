(define (problem trip_planning_example49_instance)
    (:domain trip_planning_example49)
    (:objects
        traveler_agent - traveler
        reykjavik milan split - city
        day_0 day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
        day_1 day_2 day_3 - day_one_to_three
        day_0 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day_later
        rc_0 rc_1 rc_2 rc_3 rc_4 rc_5 - reykjavik_day_count
        mc_0 mc_1 mc_2 mc_3 mc_4 mc_5 mc_6 mc_7 - milan_day_count
        sc_0 sc_1 sc_2 sc_3 - split_day_count
        tc_0 tc_1 tc_2 tc_3 tc_4 tc_5 tc_6 tc_7 tc_8 tc_9 tc_10 tc_11 tc_12 tc_13 - total_day_count
    )
    (:init
        (at traveler_agent reykjavik) ; Assuming starting city is Reykjavik as not specified
        (current_day day_0) ; Represents the time before day 1 officially starts

        ; Day sequencing
        (next_day day_0 day_1)
        (next_day day_1 day_2)
        (next_day day_2 day_3)
        (next_day day_3 day_4)
        (next_day day_4 day_5)
        (next_day day_5 day_6)
        (next_day day_6 day_7)
        (next_day day_7 day_8)
        (next_day day_8 day_9)
        (next_day day_9 day_10)
        (next_day day_10 day_11)
        (next_day day_11 day_12)
        (next_day day_12 day_13)

        ; City connections (direct flights)
        (connected milan reykjavik)
        (connected reykjavik milan)
        (connected split milan)
        (connected milan split)

        ; Initial day counts for each city and total
        (days_in_reykjavik_count rc_0)
        (days_in_milan_count mc_0)
        (days_in_split_count sc_0)
        (total_trip_days_count tc_0)

        ; Day count increments for Reykjavik
        (next_r_count rc_0 rc_1)
        (next_r_count rc_1 rc_2)
        (next_r_count rc_2 rc_3)
        (next_r_count rc_3 rc_4)
        (next_r_count rc_4 rc_5)

        ; Day count increments for Milan
        (next_m_count mc_0 mc_1)
        (next_m_count mc_1 mc_2)
        (next_m_count mc_2 mc_3)
        (next_m_count mc_3 mc_4)
        (next_m_count mc_4 mc_5)
        (next_m_count mc_5 mc_6)
        (next_m_count mc_6 mc_7)

        ; Day count increments for Split
        (next_s_count sc_0 sc_1)
        (next_s_count sc_1 sc_2)
        (next_s_count sc_2 sc_3)

        ; Total trip day count increments
        (next_t_count tc_0 tc_1)
        (next_t_count tc_1 tc_2)
        (next_t_count tc_2 tc_3)
        (next_t_count tc_3 tc_4)
        (next_t_count tc_4 tc_5)
        (next_t_count tc_5 tc_6)
        (next_t_count tc_6 tc_7)
        (next_t_count tc_7 tc_8)
        (next_t_count tc_8 tc_9)
        (next_t_count tc_9 tc_10)
        (next_t_count tc_10 tc_11)
        (next_t_count tc_11 tc_12)
        (next_t_count tc_12 tc_13)

        ; Initial total cost
        (= (total-cost) 0)
    )
    (:goal (and
        (days_in_reykjavik_count rc_5)
        (days_in_milan_count mc_7)
        (days_in_split_count sc_3)
        (total_trip_days_count tc_13)
        (visited_split_on_day_1_to_3_flag)
    ))
    (:metric minimize (total-cost))
)