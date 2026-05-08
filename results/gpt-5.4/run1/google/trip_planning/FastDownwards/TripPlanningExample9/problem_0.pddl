(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt bucharest stuttgart - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)

    (direct_flight bucharest frankfurt)
    (direct_flight frankfurt bucharest)
    (direct_flight frankfurt stuttgart)
    (direct_flight stuttgart frankfurt)

    (workshop_window_day day_5)
    (workshop_window_day day_6)
    (workshop_window_day day_7)
    (workshop_window_day day_8)
    (workshop_window_day day_9)
    (workshop_window_day day_10)

    (frankfurt_day_0)
    (bucharest_day_0)
    (stuttgart_day_0)
  )

  (:goal
    (and
      (current_day day_11)
      (frankfurt_day_3)
      (bucharest_day_3)
      (stuttgart_day_6)
      (workshop_attended)
    )
  )
)