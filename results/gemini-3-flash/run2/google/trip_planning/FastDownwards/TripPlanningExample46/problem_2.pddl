(define (problem trip_planning_example_46_problem)
        (:domain trip_planning_example_46)
        (:objects
            seville manchester stockholm - city
            day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
            n0 n1 n2 n3 n4 n5 - count
        )
        (:init
            (at stockholm day_1)
            (stay_count seville n0)
            (stay_count manchester n0)
            (stay_count stockholm n0)
            
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
            
            (next_count n0 n1)
            (next_count n1 n2)
            (next_count n2 n3)
            (next_count n3 n4)
            (next_count n4 n5)
            
            (flight_route manchester seville)
            (flight_route seville manchester)
            (flight_route stockholm manchester)
            (flight_route manchester stockholm)
        )
        (:goal
            (and
                (stay_count seville n5)
                (stay_count manchester n5)
                (stay_count stockholm n3)
                (recorded stockholm day_1)
                (recorded stockholm day_3)
            )
        )
    )