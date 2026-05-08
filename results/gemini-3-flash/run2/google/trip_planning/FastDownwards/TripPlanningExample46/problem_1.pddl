(define (problem trip_planning_example_46_problem)
    (:domain trip_planning_example_46)
    (:objects
        seville manchester stockholm - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
        count_0 count_1 count_2 count_3 count_4 count_5 - count
    )
    (:init
        (at stockholm day_1)
        (stay_count stockholm count_1)
        (stay_count manchester count_0)
        (stay_count seville count_0)
        (can_fly_today)
        
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
        
        (next_count count_0 count_1)
        (next_count count_1 count_2)
        (next_count count_2 count_3)
        (next_count count_3 count_4)
        (next_count count_4 count_5)
        
        (fly_route stockholm manchester)
        (fly_route manchester stockholm)
        (fly_route manchester seville)
        (fly_route seville manchester)
    )
    (:goal
        (and
            (stay_count stockholm count_3)
            (stay_count manchester count_5)
            (stay_count seville count_5)
            (attended_conf day_1)
            (attended_conf day_3)
        )
    )
)