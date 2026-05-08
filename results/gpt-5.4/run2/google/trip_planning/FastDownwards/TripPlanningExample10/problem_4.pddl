(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    oslo dublin valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (at oslo)
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (last_day day_9)

    (direct oslo dublin)
    (direct dublin oslo)
    (direct dublin valencia)
    (direct valencia dublin)

    (relative_window day_5)
    (relative_window day_6)
    (relative_window day_7)
    (relative_window day_8)
    (relative_window day_9)
  )

  (:goal
    (and
      (visited_relatives)

      (spent day_1 oslo)
      (spent day_2 oslo)
      (spent day_3 dublin)
      (spent day_4 dublin)
      (spent day_5 dublin)
      (spent day_6 valencia)
      (spent day_7 valencia)
      (spent day_8 valencia)
      (spent day_9 valencia)
    )
  )
)