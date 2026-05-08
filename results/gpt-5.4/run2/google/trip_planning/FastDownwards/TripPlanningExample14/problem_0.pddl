(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    lyon frankfurt krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct lyon frankfurt)
    (direct frankfurt lyon)
    (direct frankfurt krakow)
    (direct krakow frankfurt)

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
  )

  (:goal
    (and
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (assigned day_9)
      (assigned day_10)

      (at krakow day_8)
      (at krakow day_9)
      (at krakow day_10)

      (need_lyon_day_7)
      (need_frankfurt_day_2)
      (need_krakow_day_3)
    )
  )
)