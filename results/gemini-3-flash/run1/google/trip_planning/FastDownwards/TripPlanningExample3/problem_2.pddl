(define (problem trip_planning_example_3_problem)
    (:domain trip_planning_example_3)
    (:objects
        berlin warsaw bucharest - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 - day
    )

    (:init
        (not_started)
        (current_day day_1)
        (is_day_1 day_1)
        (is_bucharest bucharest)
        
        ;; Chronological order of days
        (next day_1 day_2)
        (next day_2 day_3)
        (next day_3 day_4)
        (next day_4 day_5)
        (next day_5 day_6)
        (next day_6 day_7)

        ;; Direct flights available (bidirectional)
        (can_fly berlin warsaw)
        (can_fly warsaw berlin)
        (can_fly warsaw bucharest)
        (can_fly bucharest warsaw)

        ;; Friend is in Bucharest on these days
        (friend_at_bucharest day_5)
        (friend_at_bucharest day_6)
    )

    (:goal
        (and
            ;; Trip duration check: 6 days completed (reaches start of day 7)
            (current_day day_7)
            
            ;; Requirement: Visit Berlin for 3 days
            (has_visit_3 berlin)
            
            ;; Requirement: Visit Warsaw for 3 days
            (has_visit_3 warsaw)
            
            ;; Requirement: Stay in Bucharest for 2 days
            (has_visit_2 bucharest)
            
            ;; Requirement: Meet friend in Bucharest
            (met_friend)
        )
    )
)