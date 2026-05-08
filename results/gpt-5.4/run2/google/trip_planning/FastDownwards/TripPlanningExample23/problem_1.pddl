(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    london bucharest riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (at london)
    (current_day day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)

    (direct_flight london bucharest)
    (direct_flight bucharest london)
    (direct_flight bucharest riga)
    (direct_flight riga bucharest)

    (workshop_window day_5)
    (workshop_window day_6)
    (workshop_window day_7)
    (workshop_window day_8)

    (london_0)
    (bucharest_0)
    (riga_0)
  )

  (:goal
    (and
      (current_day day_9)
      (london_3)
      (bucharest_3)
      (riga_4)
      (or
        (day_in_city day_5 riga)
        (day_in_city day_6 riga)
        (day_in_city day_7 riga)
        (day_in_city day_8 riga))
    )
  )
)