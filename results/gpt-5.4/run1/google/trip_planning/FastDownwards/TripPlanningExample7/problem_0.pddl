(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    dubrovnik istanbul venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
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
    (next_day day_10 day_11)

    (direct_flight dubrovnik istanbul)
    (direct_flight dubrovnik venice)

    (current_day day_1)
  )

  (:goal
    (and
      (assigned day_11)

      (at day_1 venice)
      (at day_2 venice)
      (at day_3 venice)
      (at day_4 venice)
      (at day_5 venice)
      (at day_6 venice)

      (at day_7 dubrovnik)
      (at day_8 dubrovnik)
      (at day_9 dubrovnik)
      (at day_10 dubrovnik)

      (at day_9 istanbul)
      (at day_10 istanbul)
      (at day_11 istanbul)
    )
  )
)