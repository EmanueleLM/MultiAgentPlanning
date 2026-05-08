(define (problem european_trip_17_days_compact_problem)
  (:domain european_trip_17_days_compact)

  (:objects
    rome lyon zurich - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day

    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )

  (:init
    (at zurich)
    (current_day day_1)

    (remaining_rome c6)
    (remaining_lyon c6)
    (remaining_zurich c6)

    (pred_count c7 c6)
    (pred_count c6 c5)
    (pred_count c5 c4)
    (pred_count c4 c3)
    (pred_count c3 c2)
    (pred_count c2 c1)
    (pred_count c1 c0)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)
    (next day_14 day_15)
    (next day_15 day_16)
    (next day_16 day_17)

    (goal_day day_17)

    (wedding_window day_1)
    (wedding_window day_2)
    (wedding_window day_3)
    (wedding_window day_4)
    (wedding_window day_5)
    (wedding_window day_6)
    (wedding_window day_7)

    (direct rome lyon)
    (direct lyon rome)
    (direct rome zurich)
    (direct zurich rome)
  )

  (:goal
    (and
      (current_day day_17)
      (remaining_rome c0)
      (remaining_lyon c0)
      (remaining_zurich c0)
      (wedding_attended)
    )
  )
)