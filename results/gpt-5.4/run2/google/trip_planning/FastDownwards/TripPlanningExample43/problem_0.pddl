(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    dublin porto venice - city
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

    (direct_flight dublin porto)
    (direct_flight porto dublin)
    (direct_flight venice dublin)
    (direct_flight dublin venice)
  )

  (:goal
    (and
      (current_day day_10)
      (met_friends_in_window)

      (spent day_1 venice)
      (spent day_2 venice)
      (spent day_3 venice)
      (spent day_4 venice)

      (spent day_1 porto)
      (spent day_2 porto)
      (spent day_3 porto)
      (spent day_4 porto)

      (spent day_1 dublin)
      (spent day_2 dublin)
      (spent day_3 dublin)
      (spent day_4 dublin)
    )
  )
)