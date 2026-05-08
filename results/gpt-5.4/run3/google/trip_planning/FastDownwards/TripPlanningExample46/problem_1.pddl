(define (problem european_trip_11_days_instance)
  (:domain european_trip_11_days)

  (:objects
    seville manchester stockholm - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)
    (at stockholm)

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

    (direct_flight manchester seville)
    (direct_flight seville manchester)
    (direct_flight stockholm manchester)
    (direct_flight manchester stockholm)

    (seville_count_0)
    (manchester_count_0)
    (stockholm_count_0)
  )

  (:goal
    (and
      (occupied day_1 stockholm)
      (occupied day_3 stockholm)
      (seville_count_5)
      (manchester_count_5)
      (stockholm_count_3)
    )
  )
)