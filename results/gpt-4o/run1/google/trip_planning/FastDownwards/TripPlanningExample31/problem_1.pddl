(define (problem europe_trip_problem)
  (:domain europe_trip)
  (:objects 
    frankfurt reykjavik split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )
  (:init 
    (at frankfurt day_1)
    (connected frankfurt reykjavik)
    (connected reykjavik frankfurt)  ; Added missing reverse flight
    (connected frankfurt split)
    (connected split frankfurt)
    
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
    (at reykjavik day_8) 
    (at reykjavik day_9)
    (at reykjavik day_10)
    (visited frankfurt)
    (visited reykjavik)
    (visited split)
  ))
)