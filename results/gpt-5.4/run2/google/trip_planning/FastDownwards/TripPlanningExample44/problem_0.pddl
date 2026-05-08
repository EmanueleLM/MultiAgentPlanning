(define (problem european_trip_17_days_instance_problem)
  (:domain european_trip_17_days_instance)

  (:objects
    rome lyon zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 day_18 - day
  )

  (:init
    (current_day day_1)

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
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)
    (next_day day_17 day_18)

    (direct_flight rome lyon)
    (direct_flight lyon rome)
    (direct_flight rome zurich)
    (direct_flight zurich rome)

    (wedding_window_day day_1)
    (wedding_window_day day_2)
    (wedding_window_day day_3)
    (wedding_window_day day_4)
    (wedding_window_day day_5)
    (wedding_window_day day_6)
    (wedding_window_day day_7)
  )

  (:goal
    (and
      (current_day day_18)

      (day_assigned day_1)
      (day_assigned day_2)
      (day_assigned day_3)
      (day_assigned day_4)
      (day_assigned day_5)
      (day_assigned day_6)
      (day_assigned day_7)
      (day_assigned day_8)
      (day_assigned day_9)
      (day_assigned day_10)
      (day_assigned day_11)
      (day_assigned day_12)
      (day_assigned day_13)
      (day_assigned day_14)
      (day_assigned day_15)
      (day_assigned day_16)
      (day_assigned day_17)

      (rome_need_6)
      (lyon_need_6)
      (zurich_need_7)

      (wedding_attended)
    )
  )
)