(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    reykjavik milan split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (direct milan reykjavik)
    (direct reykjavik milan)
    (direct split milan)
    (direct milan split)

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

    (current_day day_1)
    (start_unset)
  )

  (:goal
    (and
      (trip_complete)
      (met_split_window)

      (need_reykjavik_day_1)
      (need_reykjavik_day_2)
      (need_reykjavik_day_3)
      (need_reykjavik_day_4)
      (need_reykjavik_day_5)

      (need_milan_day_1)
      (need_milan_day_2)
      (need_milan_day_3)
      (need_milan_day_4)
      (need_milan_day_5)
      (need_milan_day_6)
      (need_milan_day_7)

      (need_split_day_1)
      (need_split_day_2)
      (need_split_day_3)
    )
  )
)