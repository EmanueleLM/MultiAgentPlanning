(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct_flight frankfurt florence)
    (direct_flight florence frankfurt)
    (direct_flight frankfurt valencia)
    (direct_flight valencia frankfurt)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (day_now day_1)
    (at valencia)
  )

  (:goal
    (and
      (day_now day_10)
      (spent_frankfurt_5)
      (spent_florence_4)
      (spent_valencia_2)
      (visited_valencia_day1)
      (visited_valencia_day2)
    )
  )
)