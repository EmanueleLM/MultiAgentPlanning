(define (problem european_trip_problem)
  (:domain european_trip)
  (:objects
    berlin porto krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )
  (:init
    (current_city berlin)
    (on_day day_1)
    (direct_flight berlin porto)
    (direct_flight porto berlin)
    (direct_flight krakow berlin)
    (direct_flight berlin krakow)

    (next day_1 day_2) (next day_2 day_3) (next day_3 day_4)
    (next day_4 day_5) (next day_5 day_6) (next day_6 day_7)
    (next day_7 day_8) (next day_8 day_9) (next day_9 day_10)
    (next day_10 day_11)
  )
  (:goal (and
    (visited berlin)
    (visited porto)
    (visited krakow)
    (wedding_attended)
    (current_city porto)
    (on_day day_11)
  ))