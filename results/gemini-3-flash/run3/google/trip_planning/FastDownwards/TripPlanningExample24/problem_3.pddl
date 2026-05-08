(define (problem trip_planning_problem_24)
    (:domain trip_planning_example_24)
    (:objects
        florence amsterdam riga - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 done - day
        n0 n1 n2 n3 n4 n5 n6 - count
    )
    (:init
        (at_city florence)
        (current_day d1)
        (count_at florence n0)
        (count_at amsterdam n0)
        (count_at riga n0)

        (is_florence florence)
        (is_workshop_day d1)
        (is_workshop_day d2)
        (is_workshop_day d3)
        (is_workshop_day d4)

        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 done)

        (next_count n0 n1) (next_count n1 n2) (next_count n2 n3)
        (next_count n3 n4) (next_count n4 n5) (next_count n5 n6)

        (can_fly florence amsterdam) (can_fly amsterdam florence)
        (can_fly amsterdam riga) (can_fly riga amsterdam)
    )
    (:goal (and
        (count_at florence n4)
        (count_at amsterdam n6)
        (count_at riga n5)
        (current_day done)
    ))
)