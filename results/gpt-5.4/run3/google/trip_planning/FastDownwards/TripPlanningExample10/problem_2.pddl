(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    oslo dublin valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (current_day day_1)
    (last_day day_9)

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

    (valencia_window_day day_5)
    (valencia_window_day day_6)
    (valencia_window_day day_7)
    (valencia_window_day day_8)
    (valencia_window_day day_9)
  )

  (:goal
    (and
      (visited_all_days)
      (day_spent_in day_1 oslo)
      (day_spent_in day_2 oslo)
      (day_spent_in day_3 oslo)
      (day_spent_in day_4 valencia)
      (day_spent_in day_5 valencia)
      (day_spent_in day_6 valencia)
      (day_spent_in day_7 valencia)
      (day_spent_in day_8 valencia)
      (day_spent_in day_9 dublin)
      (has_valencia_window_visit)
    )
  )
)