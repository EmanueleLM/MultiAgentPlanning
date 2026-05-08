(define (problem tripplanningexample7)
  (:domain european_trip_11_days_instance)

  (:objects
    dubrovnik istanbul venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
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

    (direct_flight dubrovnik istanbul)
    (direct_flight dubrovnik venice)
    (direct_flight istanbul dubrovnik)
    (direct_flight venice dubrovnik)

    (traveler_at venice day_1)
    (day_used day_1)
  )

  (:goal
    (and
      (traveler_at venice day_6)
      (traveler_at dubrovnik day_10)
      (traveler_at istanbul day_11)
    )
  )
)