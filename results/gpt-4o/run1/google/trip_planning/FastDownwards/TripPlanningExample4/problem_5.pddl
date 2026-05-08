(define (problem european_trip_instance)
  (:domain european_trip)
  (:objects
    seville munich tallinn - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 
    day_9 day_10 day_11 day_12 - day
  )
  (:init
    (at seville day_1)
    (current_day day_1)
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (direct_flight seville munich)
    (direct_flight munich tallinn)
  )
  (:goal (and
    (at tallinn day_12)
    (met_friend_tallinn)
    (visited seville)
    (visited munich)
    (visited tallinn)
  ))
)