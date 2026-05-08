(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)

    (direct frankfurt florence)
    (direct florence frankfurt)
    (direct frankfurt valencia)
    (direct valencia frankfurt)

    (current_day day_1)
  )

  (:goal
    (and
      (at frankfurt day_1)
      (at frankfurt day_2)
      (at frankfurt day_3)
      (at frankfurt day_4)
      (at frankfurt day_5)
      (at florence day_6)
      (at florence day_7)
      (at florence day_8)
      (at florence day_9)
      (at valencia day_1)
      (at valencia day_2)
      (visited_valencia_window)
      (current_day day_9)
    )
  )
)