(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    lyon frankfurt krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct lyon frankfurt)
    (direct frankfurt lyon)
    (direct frankfurt krakow)
    (direct krakow frankfurt)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
  )

  (:goal
    (and
      (at lyon day_1)
      (at lyon day_2)
      (at lyon day_3)
      (at lyon day_4)
      (at lyon day_5)

      (at frankfurt day_6)
      (at frankfurt day_7)

      (at krakow day_8)
      (at krakow day_9)
      (at krakow day_10)
    )
  )
)