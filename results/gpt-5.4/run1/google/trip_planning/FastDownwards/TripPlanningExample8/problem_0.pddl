(define (problem european_trip_16_days_instance_problem)
  (:domain european_trip_16_days_instance)

  (:objects
    athens krakow zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (connected zurich krakow)
    (connected krakow zurich)
    (connected athens zurich)
    (connected zurich athens)

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
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)

    (athens_count_0)
    (krakow_count_0)
    (zurich_count_0)
  )

  (:goal
    (and
      (day_assigned day_16)
      (athens_count_7)
      (krakow_count_6)
      (zurich_count_5)
      (athens_window_satisfied)
    )
  )
)