(define (problem meeting_planning_example_48_prob)
    (:domain meeting_planning_example_48)
    (:objects
        financial_district union_square - location
        joseph - person
        t_0900 t_2130 t_2145 t_2200 - time
    )
    (:init
        ;; Starting location and time
        (at financial_district t_0900)

        ;; Time sequence
        ;; t_0900 = 9:00 AM
        ;; t_2130 = 9:30 PM (Joseph arrives)
        ;; t_2145 = 9:45 PM (Meeting requirement fulfilled if started at 9:30 PM)
        ;; t_2200 = 10:00 PM (Joseph leaves)
        (next t_0900 t_2130)
        (next t_2130 t_2145)
        (next t_2145 t_2200)

        ;; Distance constraints
        ;; Travel takes 9 minutes. 
        ;; Interval t_0900 to t_2130 (750 mins) > 9 mins.
        ;; Interval t_2130 to t_2145 (15 mins) > 9 mins.
        ;; Interval t_2145 to t_2200 (15 mins) > 9 mins.
        (distance_ok financial_district union_square t_0900 t_2130)
        (distance_ok union_square financial_district t_0900 t_2130)
        (distance_ok financial_district union_square t_2130 t_2145)
        (distance_ok union_square financial_district t_2130 t_2145)
        (distance_ok financial_district union_square t_2145 t_2200)
        (distance_ok union_square financial_district t_2145 t_2200)

        ;; Joseph's presence at Union Square (9:30 PM to 10:00 PM)
        (person_at joseph union_square t_2130 t_2145)
        (person_at joseph union_square t_2145 t_2200)
    )
    (:goal
        (and
            (met joseph)
        )
    )
)