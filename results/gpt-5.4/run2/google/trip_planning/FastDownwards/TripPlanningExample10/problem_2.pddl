(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    oslo dublin valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
    c3_0 c3_1 c3_2 c3_3 - count3
    c5_0 c5_1 c5_2 c5_3 c5_4 c5_5 - count5
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
    (final_day day_9)

    (direct_flight oslo dublin)
    (direct_flight dublin oslo)
    (direct_flight dublin valencia)
    (direct_flight valencia dublin)

    (next_count3 c3_0 c3_1)
    (next_count3 c3_1 c3_2)
    (next_count3 c3_2 c3_3)

    (next_count5 c5_0 c5_1)
    (next_count5 c5_1 c5_2)
    (next_count5 c5_2 c5_3)
    (next_count5 c5_3 c5_4)
    (next_count5 c5_4 c5_5)

    (oslo_days c3_0)
    (dublin_days c3_0)
    (valencia_days c5_0)

    (relative_window day_5)
    (relative_window day_6)
    (relative_window day_7)
    (relative_window day_8)
    (relative_window day_9)
  )

  (:goal
    (and
      (trip_complete)
      (visited_relatives)
      (oslo_days c3_3)
      (dublin_days c3_3)
      (valencia_days c5_5)
    )
  )
)