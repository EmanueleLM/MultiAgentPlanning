(define (problem tripplanningexample13)
  (:domain european_trip_17_days_instance)

  (:objects
    manchester bucharest lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
  )

  (:init
    (at manchester)
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
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)

    (direct_flight manchester bucharest)
    (direct_flight bucharest manchester)
    (direct_flight bucharest lyon)
    (direct_flight lyon bucharest)
  )

  (:goal
    (and
      (spent manchester day_1)
      (spent manchester day_2)
      (spent manchester day_3)
      (spent manchester day_4)
      (spent manchester day_5)
      (spent manchester day_6)
      (spent manchester day_7)

      (spent bucharest day_8)
      (spent bucharest day_9)
      (spent bucharest day_10)
      (spent bucharest day_11)
      (spent bucharest day_12)

      (spent lyon day_13)
      (spent lyon day_14)
      (spent lyon day_15)
      (spent lyon day_16)
      (spent lyon day_17)
    )
  )
)