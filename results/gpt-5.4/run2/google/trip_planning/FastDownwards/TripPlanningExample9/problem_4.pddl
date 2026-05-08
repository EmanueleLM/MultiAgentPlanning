(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt bucharest stuttgart - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct_flight bucharest frankfurt)
    (direct_flight frankfurt bucharest)
    (direct_flight frankfurt stuttgart)
    (direct_flight stuttgart frankfurt)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (current_day day_1)
  )

  (:goal
    (and
      (visited day_1 bucharest)
      (visited day_2 bucharest)
      (visited day_3 bucharest)

      (visited day_4 frankfurt)
      (visited day_5 frankfurt)
      (visited day_6 frankfurt)

      (visited day_7 stuttgart)
      (visited day_8 stuttgart)
      (visited day_9 stuttgart)
      (visited day_10 stuttgart)
    )
  )
)