(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    barcelona krakow rome - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
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
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)

    (direct_flight barcelona krakow)
    (direct_flight krakow barcelona)
    (direct_flight rome barcelona)
    (direct_flight barcelona rome)

    (meeting_window day_10)
    (meeting_window day_11)
    (meeting_window day_12)
    (meeting_window day_13)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)

    (b_count c0)
    (k_count c0)
    (r_count c0)
  )

  (:goal
    (and
      (current_day day_13)
      (assigned day_13)
      (met_friend)
      (b_count c7)
      (k_count c4)
      (r_count c4)
    )
  )
)