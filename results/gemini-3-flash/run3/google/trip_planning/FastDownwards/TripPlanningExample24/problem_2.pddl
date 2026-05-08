(define (problem trip_planning_problem_24)
    (:domain trip_planning_example_24)
    (:objects
        florence amsterdam riga - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
        val0 val1 val2 val3 val4 val5 val6 - value
    )
    (:init
        (at florence)
        (day d1)
        (count florence val0)
        (count amsterdam val0)
        (count riga val0)

        (is_florence florence)

        (is_workshop_day d1)
        (is_workshop_day d2)
        (is_workshop_day d3)
        (is_workshop_day d4)

        (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
        (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
        (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)

        (inc val0 val1) (inc val1 val2) (inc val2 val3)
        (inc val3 val4) (inc val4 val5) (inc val5 val6)

        (can_fly florence amsterdam) (can_fly amsterdam florence)
        (can_fly amsterdam riga) (can_fly riga amsterdam)
    )
    (:goal (and
        (trip_done)
        (count florence val4)
        (count amsterdam val6)
        (count riga val5)
    ))
)