(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    oslo dublin valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (current_day day_1)
    (start_unset)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)

    (direct oslo dublin)
    (direct dublin oslo)
    (direct dublin valencia)
    (direct valencia dublin)

    (oslo_count_0)
    (dublin_count_0)
    (valencia_count_0)
  )

  (:goal
    (and
      (current_day day_9)
      (oslo_count_3)
      (dublin_count_3)
      (valencia_count_5)
      (visited_valencia_window)
    )
  )
)