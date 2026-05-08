(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct_flight berlin frankfurt)
    (direct_flight frankfurt berlin)
    (direct_flight frankfurt bucharest)
    (direct_flight bucharest frankfurt)

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

    (current_day day_1)

    (at berlin day_1)
  )

  (:goal
    (and
      (current_day day_11)

      (at berlin day_1)
      (at berlin day_2)
      (at berlin day_3)
      (at berlin day_4)
      (at berlin day_5)
      (at berlin day_6)
      (at berlin day_7)

      (at frankfurt day_8)
      (at frankfurt day_9)
      (at frankfurt day_10)
      (at frankfurt day_11)

      (at bucharest day_10)
      (at bucharest day_11)
    )
  )
)