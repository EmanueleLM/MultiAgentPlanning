(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt krakow dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
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

    (direct_flight frankfurt krakow)
    (direct_flight krakow frankfurt)
    (direct_flight dubrovnik frankfurt)
    (direct_flight frankfurt dubrovnik)

    (current_day day_1)
  )

  (:goal
    (and
      (visited_on dubrovnik day_1)
      (visited_on dubrovnik day_2)
      (visited_on dubrovnik day_3)
      (visited_on dubrovnik day_4)
      (visited_on dubrovnik day_5)
      (visited_on dubrovnik day_6)
      (visited_on dubrovnik day_7)

      (visited_on frankfurt day_1)
      (visited_on frankfurt day_2)
      (visited_on frankfurt day_3)

      (visited_on krakow day_9)
      (visited_on krakow day_10)
    )
  )
)