(define (problem visit_european_cities)
    (:domain european_trip_plan)
    (:objects 
        berlin warsaw bucharest - city
        day_1 day_2 day_3 day_4 day_5 day_6 - day
    )
    (:init 
        (at berlin day_1)
        (next_day day_1 day_2)
        (next_day day_2 day_3)
        (next_day day_3 day_4)
        (next_day day_4 day_5)
        (next_day day_5 day_6)
    )
    (:goal (and
        ; Visiting Berlin for 3 days, Warsaw for 3 days, and Bucharest for 2 days
        (or (at berlin day_1) (at berlin day_2) (at berlin day_3))
        (or (at berlin day_2) (at berlin day_3) (at berlin day_4))
        (or (at berlin day_3) (at berlin day_4) (at berlin day_5))
        (or (at warsaw day_1) (at warsaw day_2) (at warsaw day_3))
        (or (at warsaw day_2) (at warsaw day_3) (at warsaw day_4))
        (or (at warsaw day_3) (at warsaw day_4) (at warsaw day_5))
        (or (at bucharest day_5) (at bucharest day_6))
        (or (met_friend day_5) (met_friend day_6))
    ))
)