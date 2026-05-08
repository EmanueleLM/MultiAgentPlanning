(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (connected berlin frankfurt)
    (connected frankfurt berlin)
    (connected frankfurt bucharest)
    (connected bucharest frankfurt)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)

    (current_day day_1)
    (at berlin)
    (in_city_on berlin day_1)
  )

  (:goal
    (and
      (current_day day_11)

      (in_city_on berlin day_1)
      (in_city_on berlin day_2)
      (in_city_on berlin day_3)
      (in_city_on berlin day_4)
      (in_city_on berlin day_5)
      (in_city_on berlin day_6)
      (in_city_on berlin day_7)

      (in_city_on berlin day_8)
      (in_city_on berlin day_9)
      (in_city_on berlin day_10)
      (in_city_on berlin day_11)

      (in_city_on frankfurt day_8)
      (in_city_on frankfurt day_9)
      (in_city_on frankfurt day_10)
      (in_city_on frankfurt day_11)

      (in_city_on bucharest day_10)
      (in_city_on bucharest day_11)
    )
  )
)