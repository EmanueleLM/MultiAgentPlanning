(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    venice florence zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
  )

  (:init
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

    (final_day day_12)

    (direct_flight venice zurich)
    (direct_flight zurich venice)
    (direct_flight zurich florence)

    (current_day day_1)
    (at venice)
    (visited venice day_1)

    (v_count_1)
    (f_count_0)
    (z_count_0)
  )

  (:goal
    (and
      (trip_complete)
      (current_day day_12)
      (v_count_6)
      (f_count_6)
      (z_count_2)
    )
  )
)