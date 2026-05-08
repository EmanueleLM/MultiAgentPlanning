(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    berlin porto krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
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

    (direct_flight berlin porto)
    (direct_flight porto berlin)
    (direct_flight berlin krakow)
    (direct_flight krakow berlin)
  )

  (:goal
    (and
      (finished)

      (visited_on berlin day_1)
      (visited_on berlin day_2)
      (visited_on berlin day_3)
      (visited_on berlin day_4)
      (visited_on berlin day_5)
      (visited_on berlin day_6)

      (visited_on krakow day_7)
      (visited_on krakow day_8)
      (visited_on krakow day_9)

      (visited_on porto day_10)
      (visited_on porto day_11)
    )
  )
)