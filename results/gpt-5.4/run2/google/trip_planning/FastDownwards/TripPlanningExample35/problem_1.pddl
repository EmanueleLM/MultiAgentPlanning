(define (problem tripplanningexample35)
  (:domain european_trip_10_days)

  (:objects
    bucharest zurich dubrovnik - city
    day_0 day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (at bucharest)
    (current_day day_0)

    (next day_0 day_1)
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (direct_flight bucharest zurich)
    (direct_flight zurich bucharest)
    (direct_flight zurich dubrovnik)
    (direct_flight dubrovnik zurich)
  )

  (:goal
    (and
      (current_day day_10)

      (visited_on day_0 bucharest)
      (visited_on day_1 bucharest)
      (visited_on day_2 bucharest)

      (visited_on day_3 zurich)
      (visited_on day_4 dubrovnik)
      (visited_on day_5 dubrovnik)
      (visited_on day_6 dubrovnik)
      (visited_on day_7 dubrovnik)
      (visited_on day_8 dubrovnik)
      (visited_on day_9 dubrovnik)
    )
  )
)