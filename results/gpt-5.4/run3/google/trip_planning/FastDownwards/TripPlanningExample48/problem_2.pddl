(define (problem tripplanningexample48)
  (:domain european_trip_4_days)

  (:objects
    manchester split geneva - city
    day_1 day_2 day_3 day_4 - day
  )

  (:init
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)

    (direct_flight manchester split)
    (direct_flight split manchester)
    (direct_flight manchester geneva)
    (direct_flight geneva manchester)
    (direct_flight split geneva)
    (direct_flight geneva split)

    (friend_window_day day_2)
    (friend_window_day day_3)
  )

  (:goal
    (and
      (visited manchester day_1)
      (visited manchester day_2)
      (visited split day_2)
      (visited split day_3)
      (visited geneva day_4)
    )
  )
)