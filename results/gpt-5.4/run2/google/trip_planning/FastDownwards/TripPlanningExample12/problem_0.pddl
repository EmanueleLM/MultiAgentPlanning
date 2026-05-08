(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    amsterdam valencia tallinn - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )

  (:init
    (unstarted)

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
    (next_day day_13 day_14)
    (next_day day_14 day_15)

    (direct_flight amsterdam tallinn)
    (direct_flight tallinn amsterdam)
    (direct_flight valencia amsterdam)
    (direct_flight amsterdam valencia)

    (meeting_window day_9)
    (meeting_window day_10)
    (meeting_window day_11)
    (meeting_window day_12)
    (meeting_window day_13)
    (meeting_window day_14)
    (meeting_window day_15)
  )

  (:goal
    (and
      (met_friend)

      (classified day_1)
      (classified day_2)
      (classified day_3)
      (classified day_4)
      (classified day_5)
      (classified day_6)
      (classified day_7)
      (classified day_8)
      (classified day_9)
      (classified day_10)
      (classified day_11)
      (classified day_12)
      (classified day_13)
      (classified day_14)
      (classified day_15)

      (requires_valencia day_1)
      (requires_valencia day_2)
      (requires_valencia day_3)
      (requires_valencia day_4)
      (requires_valencia day_5)

      (requires_amsterdam day_6)
      (requires_amsterdam day_7)
      (requires_amsterdam day_8)
      (requires_amsterdam day_9)
      (requires_amsterdam day_10)

      (requires_tallinn day_9)
      (requires_tallinn day_10)
      (requires_tallinn day_11)
      (requires_tallinn day_12)
      (requires_tallinn day_13)
      (requires_tallinn day_14)
      (requires_tallinn day_15)
    )
  )
)