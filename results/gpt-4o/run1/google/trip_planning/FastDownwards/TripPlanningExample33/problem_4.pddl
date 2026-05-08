(define (problem visit_3_cities)
    (:domain city_visit)
    
    (:objects
        krakow rome barcelona - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
    )
    
    (:init
        (at barcelona day_1)
    
        (flight_available barcelona krakow)
        (flight_available barcelona rome)
        (flight_available rome barcelona)
    
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
        (next_day day_11 day_12)
        (next_day day_12 day_13)
    
        (between_days_10_and_13 day_10)
        (between_days_10_and_13 day_11)
        (between_days_10_and_13 day_12)
        (between_days_10_and_13 day_13)
    )
    
    (:goal (and
        (at krakow day_9) (at krakow day_10) (at krakow day_11) (at krakow day_12) (at krakow day_13)
        (at rome day_5) (at rome day_6) (at rome day_7) (at rome day_8)
        (met_friend_krakow day_10)
    ))
    
)