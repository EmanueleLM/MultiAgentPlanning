(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    oslo dublin valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (at oslo)
    (current day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
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
      (goal_ok)
      (visited_relatives)

      (spent day_1 oslo)
      (spent day_2 oslo)
      (spent day_3 oslo)

      (spent day_4 dublin)
      (spent day_5 dublin)
      (spent day_6 dublin)

      (spent day_7 valencia)
      (spent day_8 valencia)
      (spent day_9 valencia)
      (spent day_5 valencia)
      (spent day_6 valencia)
    )
  )
)