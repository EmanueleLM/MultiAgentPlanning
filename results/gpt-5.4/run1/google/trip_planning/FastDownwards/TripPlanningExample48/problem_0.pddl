(define (problem european_trip_4_days_instance)
  (:domain european_trip_4_days)

  (:objects
    manchester split geneva - city
    day_1 day_2 day_3 day_4 - day
  )

  (:init
    (direct manchester split)
    (direct split manchester)
    (direct manchester geneva)
    (direct geneva manchester)
    (direct split geneva)
    (direct geneva split)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)

    (meeting_day day_2)
    (meeting_day day_3)

    (current_day day_1)

    (used_manchester_0)
    (used_split_0)
    (used_geneva_0)
  )

  (:goal
    (and
      (day_assigned day_1)
      (day_assigned day_2)
      (day_assigned day_3)
      (day_assigned day_4)
      (trip_complete)
      (friend_met)
      (used_manchester_2)
      (used_split_2)
      (used_geneva_2)
    )
  )
)