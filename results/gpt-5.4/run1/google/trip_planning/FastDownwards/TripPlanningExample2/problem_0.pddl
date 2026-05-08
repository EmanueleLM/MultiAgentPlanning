(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    reykjavik vienna venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (start_unassigned)

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

    (direct_flight reykjavik vienna)
    (direct_flight vienna reykjavik)
    (direct_flight vienna venice)
    (direct_flight venice vienna)

    (r_count_0)
    (v_count_0)
    (ve_count_0)
  )

  (:goal
    (and
      (advanced_from day_1)
      (advanced_from day_2)
      (advanced_from day_3)
      (advanced_from day_4)
      (advanced_from day_5)
      (advanced_from day_6)
      (advanced_from day_7)
      (advanced_from day_8)
      (advanced_from day_9)
      (advanced_from day_10)

      (r_count_2)
      (v_count_7)
      (ve_count_4)

      (attended_wedding_window)
    )
  )
)