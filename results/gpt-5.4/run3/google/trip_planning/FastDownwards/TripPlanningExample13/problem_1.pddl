(define (problem european_trip_17_days_instance_problem)
  (:domain european_trip_17_days_instance)

  (:objects
    manchester bucharest lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
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
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)

    (last_day day_17)

    (direct_flight manchester bucharest)
    (direct_flight bucharest manchester)
    (direct_flight bucharest lyon)
    (direct_flight lyon bucharest)

    (lyon_window_day day_13)
    (lyon_window_day day_14)
    (lyon_window_day day_15)
    (lyon_window_day day_16)
    (lyon_window_day day_17)

    (at manchester)
  )

  (:goal
    (and
      (visited_manchester day_1)
      (visited_manchester day_2)
      (visited_manchester day_3)
      (visited_manchester day_4)
      (visited_manchester day_5)
      (visited_manchester day_6)
      (visited_manchester day_7)

      (visited_bucharest day_8)
      (visited_bucharest day_9)
      (visited_bucharest day_10)
      (visited_bucharest day_11)
      (visited_bucharest day_12)
      (visited_bucharest day_13)
      (visited_bucharest day_14)

      (visited_lyon day_13)
      (visited_lyon day_14)
      (visited_lyon day_15)
      (visited_lyon day_16)
      (visited_lyon day_17)
    )
  )
)