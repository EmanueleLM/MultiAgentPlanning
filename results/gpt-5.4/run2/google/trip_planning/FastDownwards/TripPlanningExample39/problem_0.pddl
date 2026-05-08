(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    porto barcelona florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
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
    (next_day day_11 day_12)

    (window_day day_1)
    (window_day day_2)
    (window_day day_3)

    (direct_flight porto barcelona)
    (direct_flight barcelona porto)
    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
  )

  (:goal
    (and
      (visited_relatives_in_window)

      (assigned day_1 porto)
      (assigned day_2 porto)
      (assigned day_3 porto)

      (assigned day_4 barcelona)
      (assigned day_5 barcelona)
      (assigned day_6 barcelona)
      (assigned day_7 barcelona)
      (assigned day_8 barcelona)
      (assigned day_9 barcelona)
      (assigned day_10 barcelona)

      (assigned day_11 florence)
      (assigned day_12 florence)

      (assigned day_9 florence)
      (assigned day_10 florence)
    )
  )
)