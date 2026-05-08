(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt krakow dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
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

    (direct_flight frankfurt krakow)
    (direct_flight krakow frankfurt)
    (direct_flight dubrovnik frankfurt)
    (direct_flight frankfurt dubrovnik)

    (current_day day_1)
  )

  (:goal
    (and
      (assigned day_10)

      (used_krakow_1)
      (used_krakow_2)

      (used_frankfurt_1)
      (used_frankfurt_2)
      (used_frankfurt_3)

      (used_dubrovnik_1)
      (used_dubrovnik_2)
      (used_dubrovnik_3)
      (used_dubrovnik_4)
      (used_dubrovnik_5)
      (used_dubrovnik_6)
      (used_dubrovnik_7)

      (at krakow day_9)
      (at krakow day_10)
    )
  )
)