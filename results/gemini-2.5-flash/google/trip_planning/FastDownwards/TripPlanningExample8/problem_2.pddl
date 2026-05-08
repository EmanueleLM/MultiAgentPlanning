(define (problem trip_planning_example_8_problem)
    (:domain trip_planning_example_8)
    (:init
        ;; Initial location (arbitrarily starting at Krakow)
        (at krakow)

        ;; Current day starts before the first trip day
        (current_day day_0)

        ;; Days left for each city stay
        (krakow_days_left c_6)
        (athens_days_left c_7)
        (zurich_days_left c_5)

        ;; Direct flight connections
        (connected zurich krakow)
        (connected krakow zurich)
        (connected athens zurich)
        (connected zurich athens)

        ;; Day succession facts
        (day_succ day_0 day_1)
        (day_succ day_1 day_2)
        (day_succ day_2 day_3)
        (day_succ day_3 day_4)
        (day_succ day_4 day_5)
        (day_succ day_5 day_6)
        (day_succ day_6 day_7)
        (day_succ day_7 day_8)
        (day_succ day_8 day_9)
        (day_succ day_9 day_10)
        (day_succ day_10 day_11)
        (day_succ day_11 day_12)
        (day_succ day_12 day_13)
        (day_succ day_13 day_14)
        (day_succ day_14 day_15)
        (day_succ day_15 day_16)
        (day_succ day_16 day_17)
        (day_succ day_17 day_18)

        ;; Days count succession facts (for decrementing counters)
        ;; These are not directly used in the current stay actions, but generally useful.
        (count_succ c_0 c_1)
        (count_succ c_1 c_2)
        (count_succ c_2 c_3)
        (count_succ c_3 c_4)
        (count_succ c_4 c_5)
        (count_succ c_5 c_6)
        (count_succ c_6 c_7)
    )
    (:goal (and
        (krakow_days_left c_0)
        (athens_days_left c_0)
        (zurich_days_left c_0)
        ;; The orchestrator prioritizes fulfilling all 18 required stay days.
        ;; Since the trip starts conceptually on day_0 and each stay action advances the day,
        ;; 18 stay days will lead to day_18 as the final current_day.
        (current_day day_18)
    ))
)