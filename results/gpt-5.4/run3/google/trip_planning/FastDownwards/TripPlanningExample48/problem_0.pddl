(define (problem european_trip_4_days_instance)
  (:domain european_trip_4_days)

  (:objects
    manchester split geneva - city
    day_1 day_2 day_3 day_4 - day
  )

  (:init
    (start)

    (m_count_0)
    (s_count_0)
    (g_count_0)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)

    (direct_flight manchester split)
    (direct_flight split manchester)
    (direct_flight split geneva)
    (direct_flight geneva split)
    (direct_flight manchester geneva)
    (direct_flight geneva manchester)
  )

  (:goal
    (and
      (m_count_2)
      (s_count_2)
      (g_count_2)
      (met_friend_in_window)
      (trip_complete)
      (visited_on manchester day_1)
      (visited_on manchester day_2)
      (visited_on split day_3)
      (visited_on split day_4)
      (visited_on geneva day_1)
      (visited_on geneva day_2)
    )
  )
)