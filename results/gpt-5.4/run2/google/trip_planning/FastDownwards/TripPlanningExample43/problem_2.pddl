(define (problem tripplanningexample43)
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
      (met_friends)

      (visited_on venice day_1)
      (visited_on venice day_2)
      (visited_on venice day_3)
      (visited_on venice day_4)

      (visited_on porto day_5)
      (visited_on porto day_6)
      (visited_on porto day_7)
      (visited_on porto day_8)

      (visited_on dublin day_9)
      (visited_on dublin day_10)
    )
  )
)