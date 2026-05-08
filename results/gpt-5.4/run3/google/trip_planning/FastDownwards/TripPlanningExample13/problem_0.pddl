(define (problem european_trip_17_days_instance_problem)
  (:domain european_trip_17_days_instance)

  (:objects
    manchester bucharest lyon - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day

    manchester_d1 manchester_d2 manchester_d3 manchester_d4 manchester_d5 manchester_d6 manchester_d7 - visit_token
    bucharest_d1 bucharest_d2 bucharest_d3 bucharest_d4 bucharest_d5 bucharest_d6 bucharest_d7 - visit_token
    lyon_d1 lyon_d2 lyon_d3 lyon_d4 lyon_d5 - visit_token
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

    (window_day day_13)
    (window_day day_14)
    (window_day day_15)
    (window_day day_16)
    (window_day day_17)

    (token_for_city manchester_d1 manchester)
    (token_for_city manchester_d2 manchester)
    (token_for_city manchester_d3 manchester)
    (token_for_city manchester_d4 manchester)
    (token_for_city manchester_d5 manchester)
    (token_for_city manchester_d6 manchester)
    (token_for_city manchester_d7 manchester)

    (token_for_city bucharest_d1 bucharest)
    (token_for_city bucharest_d2 bucharest)
    (token_for_city bucharest_d3 bucharest)
    (token_for_city bucharest_d4 bucharest)
    (token_for_city bucharest_d5 bucharest)
    (token_for_city bucharest_d6 bucharest)
    (token_for_city bucharest_d7 bucharest)

    (token_for_city lyon_d1 lyon)
    (token_for_city lyon_d2 lyon)
    (token_for_city lyon_d3 lyon)
    (token_for_city lyon_d4 lyon)
    (token_for_city lyon_d5 lyon)

    (unused manchester_d1)
    (unused manchester_d2)
    (unused manchester_d3)
    (unused manchester_d4)
    (unused manchester_d5)
    (unused manchester_d6)
    (unused manchester_d7)

    (unused bucharest_d1)
    (unused bucharest_d2)
    (unused bucharest_d3)
    (unused bucharest_d4)
    (unused bucharest_d5)
    (unused bucharest_d6)
    (unused bucharest_d7)

    (unused lyon_d1)
    (unused lyon_d2)
    (unused lyon_d3)
    (unused lyon_d4)
    (unused lyon_d5)
  )

  (:goal
    (and
      (trip_complete)
      (visited_lyon_in_window)

      (claimed manchester_d1)
      (claimed manchester_d2)
      (claimed manchester_d3)
      (claimed manchester_d4)
      (claimed manchester_d5)
      (claimed manchester_d6)
      (claimed manchester_d7)

      (claimed bucharest_d1)
      (claimed bucharest_d2)
      (claimed bucharest_d3)
      (claimed bucharest_d4)
      (claimed bucharest_d5)
      (claimed bucharest_d6)
      (claimed bucharest_d7)

      (claimed lyon_d1)
      (claimed lyon_d2)
      (claimed lyon_d3)
      (claimed lyon_d4)
      (claimed lyon_d5)
    )
  )
)