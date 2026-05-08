(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    dubrovnik berlin munich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)

    (direct munich dubrovnik)
    (direct dubrovnik munich)
    (direct berlin munich)
    (direct munich berlin)

    (current_day day_1)
  )

  (:goal
    (and
      (day_closed day_1)
      (day_closed day_2)
      (day_closed day_3)
      (day_closed day_4)
      (day_closed day_5)
      (day_closed day_6)
      (day_closed day_7)
      (day_closed day_8)

      (spent day_1 berlin)
      (spent day_4 berlin)

      (spent day_1 berlin)
      (spent day_2 berlin)
      (spent day_3 berlin)
      (spent day_4 berlin)

      (spent day_5 dubrovnik)
      (spent day_6 dubrovnik)
      (spent day_7 dubrovnik)

      (spent day_6 munich)
      (spent day_7 munich)
      (spent day_8 munich)
    )
  )
)