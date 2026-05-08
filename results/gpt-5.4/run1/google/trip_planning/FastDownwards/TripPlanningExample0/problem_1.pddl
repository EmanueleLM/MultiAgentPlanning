(define (problem european_trip_14_days_instance)
  (:domain european_trip_14_days)

  (:objects
    barcelona florence helsinki - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
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
    (next_day day_13 day_14)

    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight helsinki barcelona)
    (direct_flight barcelona helsinki)

    (meeting_day day_9)
    (meeting_day day_10)
    (meeting_day day_11)
    (meeting_day day_12)
    (meeting_day day_13)
    (meeting_day day_14)

    (florence_count_0)
    (barcelona_count_0)
    (helsinki_count_0)
  )

  (:goal
    (and
      (started)
      (current_day day_14)
      (met_friend)
      (florence_count_6)
      (barcelona_count_5)
      (helsinki_count_5)
    )
  )
)