(define (problem european_trip_10_day_instance_problem)
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

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (current_day day_1)
    (at bucharest)
    (day_in_city day_1 bucharest)
  )

  (:goal
    (and
      (current_day day_10)

      (day_in_city day_1 bucharest)
      (day_in_city day_2 bucharest)
      (day_in_city day_3 bucharest)

      (day_in_city day_4 zurich)
      (day_in_city day_5 zurich)

      (day_in_city day_4 dubrovnik)
      (day_in_city day_5 dubrovnik)
      (day_in_city day_6 dubrovnik)
      (day_in_city day_7 dubrovnik)
      (day_in_city day_8 dubrovnik)
      (day_in_city day_9 dubrovnik)
      (day_in_city day_10 dubrovnik)
    )
  )
)