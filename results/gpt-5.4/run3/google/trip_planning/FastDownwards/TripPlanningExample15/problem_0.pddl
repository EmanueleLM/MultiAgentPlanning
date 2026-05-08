(define (problem european_trip_11_days_unsat_instance)
  (:domain european_trip_11_days_unsat)

  (:objects
    berlin porto krakow - city
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

    (connected berlin porto)
    (connected porto berlin)
    (connected krakow berlin)
    (connected berlin krakow)

    (berlin_count_0)
    (porto_count_0)
    (krakow_count_0)
  )

  (:goal
    (and
      (assigned day_11)
      (at day_10 porto)
      (at day_11 porto)
      (berlin_count_6)
      (porto_count_2)
      (krakow_count_5)
    )
  )
)