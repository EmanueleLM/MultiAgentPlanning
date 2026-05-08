(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    berlin porto krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (not_started)

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

    (direct_flight berlin porto)
    (direct_flight porto berlin)
    (direct_flight krakow berlin)
    (direct_flight berlin krakow)
  )

  (:goal
    (and
      (trip_finished)

      (day_assigned day_1)
      (day_assigned day_2)
      (day_assigned day_3)
      (day_assigned day_4)
      (day_assigned day_5)
      (day_assigned day_6)
      (day_assigned day_7)
      (day_assigned day_8)
      (day_assigned day_9)
      (day_assigned day_10)
      (day_assigned day_11)

      (visited_on porto day_10)
      (visited_on porto day_11)

      (visited_on berlin day_1)
      (visited_on berlin day_2)
      (visited_on berlin day_3)
      (visited_on berlin day_4)
      (visited_on berlin day_5)
      (visited_on berlin day_6)

      (visited_on krakow day_7)
      (visited_on krakow day_8)
      (visited_on krakow day_9)
      (visited_on krakow day_10)
      (visited_on krakow day_11)
    )
  )
)