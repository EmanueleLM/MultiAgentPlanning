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

    (need_relatives day_4)

    (current_day day_1)
    (at bucharest)
    (visited day_1 bucharest)
  )

  (:goal
    (and
      (current_day day_10)

      (visited day_1 bucharest)
      (visited day_2 bucharest)
      (visited day_3 bucharest)

      (visited day_4 zurich)
      (visited day_5 zurich)

      (visited day_4 dubrovnik)
      (visited day_5 dubrovnik)
      (visited day_6 dubrovnik)
      (visited day_7 dubrovnik)
      (visited day_8 dubrovnik)
      (visited day_9 dubrovnik)
      (visited day_10 dubrovnik)

      (relatives_visited day_4)
    )
  )
)