(define (problem europe_trip_problem)
  (:domain europe_trip)
  (:objects 
    frankfurt reykjavik split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )
  (:init 
    (at frankfurt day_1)
    (connected frankfurt reykjavik)
    (connected split frankfurt)
    
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
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