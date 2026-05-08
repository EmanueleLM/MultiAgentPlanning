(define (problem trip_planning_example_45_problem)
    (:domain trip_planning_example_45)
    (:objects
        copenhagen lisbon florence - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
        n0 n1 n2 n3 n4 n5 n6 n7 - count
    )

    (:init
        (at copenhagen d1)
        (can_fly copenhagen lisbon)
        (can_fly lisbon copenhagen)
        (can_fly lisbon florence)
        (can_fly florence lisbon)
        
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)
        
        (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
        (next_count n4 n5) (next_count n5 n6) (next_count n6 n7)
        
        (count_copenhagen n0)
        (count_lisbon n0)
        (count_florence n0)
    )

    (:goal (and
        (count_copenhagen n7)
        (count_lisbon n7)
        (count_florence n4)
        (visited_at copenhagen d1)
        (visited_at copenhagen d7)
        ;; The trip is 16 days total. 16 actions lead to day 17.
        (at florence d17)
    ))
)