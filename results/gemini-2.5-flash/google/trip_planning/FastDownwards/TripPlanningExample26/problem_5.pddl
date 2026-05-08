(define (problem trip_planning_example_26)
    (:domain trip_planning)
    (:objects
        porto berlin reykjavik - city
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time_point
        d0 d1 d2 d3 d4 d5 d6 d7 - day_counter ; d7 is included to allow 'next_day_count d6 d7' and to enforce max stay of d6 for Porto
    )
    (:init
        ; Initial location (assuming Porto as a starting point, as no explicit start is given)
        (at porto)

        ; Initial time point
        (current_time t0)

        ; Initial stay days for all cities
        (porto_stay_days d0)
        (berlin_stay_days d0)
        (reykjavik_stay_days d0)

        ; Next day count sequence (for stay counters)
        (next_day_count d0 d1) (next_day_count d1 d2) (next_day_count d2 d3)
        (next_day_count d3 d4) (next_day_count d4 d5) (next_day_count d5 d6)
        (next_day_count d6 d7)

        ; Time point sequence for the overall trip
        (next_time t0 t1) (next_time t1 t2) (next_time t2 t3) (next_time t3 t4)
        (next_time t4 t5) (next_time t5 t6) (next_time t6 t7) (next_time t7 t8)
        (next_time t8 t9) (next_time t9 t10) (next_time t10 t11) (next_time t11 t12)
        (next_time t12 t13) (next_time t13 t14) (next_time t14 t15) (next_time t15 t16)

        ; Direct flight connections (bidirectional)
        (connected berlin reykjavik)
        (connected reykjavik berlin)
        (connected porto berlin)
        (connected berlin porto)

        ; Friend meeting state
        (not (met_friend))

        ; Define the meeting window (Day 12 to Day 16 inclusive)
        (meeting_window t12)
        (meeting_window t13)
        (meeting_window t14)
        (meeting_window t15)
        (meeting_window t16)
    )
    (:goal (and
        (current_time t16) ; The trip must end exactly on day 16
        (met_friend)       ; The friend meeting must occur
        ; Reconciled stay durations to fit within 16 days (7+6+5=18, cut 2 days)
        ; One possible reconciliation: Porto 6 days, Berlin 5 days, Reykjavik 5 days. Total 16 days.
        (porto_stay_days d6)
        (berlin_stay_days d5)
        (reykjavik_stay_days d5)
    ))