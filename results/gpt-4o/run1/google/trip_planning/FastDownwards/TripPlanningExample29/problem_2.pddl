(define (problem travel-problem)
  (:domain travel)

  (:objects 
    krakow dubrovnik frankfurt - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (at frankfurt day_1)
    (direct_flight frankfurt krakow)
    (direct_flight krakow frankfurt)
    (direct_flight frankfurt dubrovnik)
    (direct_flight dubrovnik frankfurt)
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
  )

  (:goal (and 
    (visited krakow)
    (visited dubrovnik)
    (visited frankfurt)
    (at krakow day_9)
    (at krakow day_10)
  ))
)