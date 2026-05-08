(define (problem tripplanningexample35)
  (:domain european_trip_10_day_instance)

  (:objects
    bucharest zurich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct bucharest zurich)
    (direct zurich bucharest)
    (direct zurich dubrovnik)
    (direct dubrovnik zurich)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (current day_1)
    (at bucharest)
    (occupied day_1 bucharest)
  )

  (:goal
    (and
      (current day_10)

      (occupied day_1 bucharest)
      (occupied day_2 bucharest)
      (occupied day_3 bucharest)

      (occupied day_4 dubrovnik)
      (occupied day_5 dubrovnik)
      (occupied day_6 dubrovnik)
      (occupied day_7 dubrovnik)
      (occupied day_8 dubrovnik)
      (occupied day_9 dubrovnik)
      (occupied day_10 dubrovnik)
    )
  )
)