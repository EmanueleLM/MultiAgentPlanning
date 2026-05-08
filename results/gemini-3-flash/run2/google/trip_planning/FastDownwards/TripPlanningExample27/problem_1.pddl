(define (problem trip_plan_problem)
    (:domain trip_planning)
    (:objects
        istanbul amsterdam santorini - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
        n0 n1 n2 n3 n4 n5 n6 n7 - count
    )
    (:init
        (at istanbul)
        (current_day d1)
        (final_day d14)
        
        ;; Initialize counts
        (city_count istanbul n0)
        (city_count amsterdam n0)
        (city_count santorini n0)
        
        ;; Day sequence
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
        (next_day d13 d14)
        
        ;; Count sequence
        (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
        (next_count n4 n5) (next_count n5 n6) (next_count n6 n7)
        
        ;; Flight connections
        (flight amsterdam santorini) (flight santorini amsterdam)
        (flight istanbul amsterdam) (flight amsterdam istanbul)
    )
    (:goal
        (and
            (done)
            (city_count istanbul n6)
            (city_count amsterdam n7)
            (city_count santorini n3)
            ;; Constraint: Visit relatives in Santorini between day 12 and 14
            (visited santorini d12)
            (visited santorini d13)
            (visited santorini d14)
        )
    )
)