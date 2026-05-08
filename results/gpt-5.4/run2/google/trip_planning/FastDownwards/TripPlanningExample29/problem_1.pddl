(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt krakow dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (direct_flight frankfurt krakow)
    (direct_flight krakow frankfurt)
    (direct_flight dubrovnik frankfurt)
    (direct_flight frankfurt dubrovnik)

    (current_day day_1)
  )

  (:goal
    (and
      (current_day day_10)

      (count_krakow_2)
      (count_frankfurt_3)
      (count_dubrovnik_7)

      (visited krakow day_9)
      (visited krakow day_10)
    )
  )
)