(define (problem european_trip_11_days_instance)
  (:domain european_trip_11_days)

  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)
    (at berlin)
    (visited_on berlin day_1)

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

    (last_day day_11)

    (direct_flight berlin frankfurt)
    (direct_flight frankfurt berlin)
    (direct_flight frankfurt bucharest)
    (direct_flight bucharest frankfurt)
  )

  (:goal
    (and
      (current_day day_11)

      (visited_on berlin day_1)
      (visited_on berlin day_2)
      (visited_on berlin day_3)
      (visited_on berlin day_4)
      (visited_on berlin day_5)
      (visited_on berlin day_6)
      (visited_on berlin day_7)

      (visited_on frankfurt day_8)
      (visited_on frankfurt day_9)
      (visited_on frankfurt day_10)
      (visited_on frankfurt day_11)

      (visited_on bucharest day_10)
      (visited_on bucharest day_11)
    )
  )
)