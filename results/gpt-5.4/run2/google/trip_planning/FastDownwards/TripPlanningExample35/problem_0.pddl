(define (problem european_trip_10_days_instance)
  (:domain european_trip_10_days)

  (:objects
    bucharest zurich dubrovnik - city
    day_0 day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (at bucharest)
    (current_day day_0)

    (next_day day_0 day_1)
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (direct_flight bucharest zurich)
    (direct_flight zurich bucharest)
    (direct_flight zurich dubrovnik)
    (direct_flight dubrovnik zurich)

    (dubrovnik_window_start day_3)
    (dubrovnik_window_start day_4)
    (dubrovnik_window_start day_5)
    (dubrovnik_window_start day_6)
    (dubrovnik_window_start day_7)
    (dubrovnik_window_start day_8)
    (dubrovnik_window_start day_9)
  )

  (:goal
    (and
      (current_day day_10)
      (met_dubrovnik_window)

      (spent_day_in day_0 bucharest)
      (spent_day_in day_1 bucharest)
      (spent_day_in day_2 bucharest)

      (spent_day_in day_3 zurich)
      (spent_day_in day_4 zurich)

      (spent_day_in day_5 dubrovnik)
      (spent_day_in day_6 dubrovnik)
      (spent_day_in day_7 dubrovnik)
      (spent_day_in day_8 dubrovnik)
      (spent_day_in day_9 dubrovnik)
      (spent_day_in day_3 dubrovnik)
      (spent_day_in day_4 dubrovnik)
    )
  )
)