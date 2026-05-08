(define (problem european_trip_instance)
  (:domain european_trip)
  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 
    day_8 day_9 day_10 day_11 - day
  )
  (:init
    (at berlin day_1)
    (can_travel berlin frankfurt)
    (can_travel frankfurt berlin)
    (can_travel frankfurt bucharest)
    (can_travel bucharest frankfurt)
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
  )
  (:goal (and
    (visited berlin)
    (visited frankfurt)
    (visited bucharest)
    (at berlin day_7)
    (at frankfurt day_4)
    (at bucharest day_6)
  ))
)