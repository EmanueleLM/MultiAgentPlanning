(define (problem tripplanningexample7)
  (:domain european_trip_11_days)

  (:objects
    dubrovnik istanbul venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
  )

  (:init
    (at dubrovnik)
    (today day_1)

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

    (direct_flight dubrovnik istanbul)
    (direct_flight istanbul dubrovnik)
    (direct_flight dubrovnik venice)
    (direct_flight venice dubrovnik)
  )

  (:goal
    (and
      (today day_12)

      (counted venice day_1)
      (counted venice day_2)
      (counted venice day_3)
      (counted venice day_4)
      (counted venice day_5)
      (counted venice day_6)

      (counted dubrovnik day_7)
      (counted dubrovnik day_8)
      (counted dubrovnik day_9)
      (counted dubrovnik day_10)

      (counted istanbul day_11)
    )
  )
)