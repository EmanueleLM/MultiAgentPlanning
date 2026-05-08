(define (problem tripplanningexample35)
  (:domain european_trip_10_day_instance)

  (:objects
    bucharest zurich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct_flight bucharest zurich)
    (direct_flight zurich bucharest)
    (direct_flight zurich dubrovnik)
    (direct_flight dubrovnik zurich)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (today day_1)
    (at bucharest)
    (visited_on day_1 bucharest)
  )

  (:goal
    (and
      (today day_10)

      (visited_on day_1 bucharest)
      (visited_on day_2 bucharest)
      (visited_on day_3 bucharest)

      (visited_on day_4 zurich)
      (visited_on day_5 zurich)

      (visited_on day_4 dubrovnik)
      (visited_on day_5 dubrovnik)
      (visited_on day_6 dubrovnik)
      (visited_on day_7 dubrovnik)
      (visited_on day_8 dubrovnik)
      (visited_on day_9 dubrovnik)
      (visited_on day_10 dubrovnik)
    )
  )
)