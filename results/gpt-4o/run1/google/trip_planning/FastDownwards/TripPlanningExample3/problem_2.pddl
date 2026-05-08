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
        (visited berlin day_3)
        (visited warsaw day_4)
        (visited bucharest day_6)
        (met_friend day_5)
    ))
)