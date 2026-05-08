(define (problem trip_planning_example48_instance)
  (:domain trip_planning_example48)

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

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)

    (current_day day_1)

    (at manchester day_1)
    (in_manchester day_1)
  )

  (:goal
    (and
      (in_split day_2)
      (in_split day_3)
      (friend_met)
      (in_manchester day_1)
      (in_manchester day_4)
      (in_geneva day_2)
      (in_geneva day_3)
    )
  )
)