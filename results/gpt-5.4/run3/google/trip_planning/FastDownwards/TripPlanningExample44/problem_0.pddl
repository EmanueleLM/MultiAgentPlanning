(define (problem european_trip_17_days_instance_problem)
  (:domain european_trip_17_days_instance)

  (:objects
    rome lyon zurich - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day

    lyon_0 lyon_1 lyon_2 lyon_3 lyon_4 lyon_5 lyon_6
    zurich_0 zurich_1 zurich_2 zurich_3 zurich_4 zurich_5 zurich_6 zurich_7
    rome_0 rome_1 rome_2 rome_3 rome_4 rome_5 rome_6 - count
  )

  (:init
    (current_day day_1)

    (at zurich)

    (lyon_count lyon_0)
    (zurich_count zurich_1)
    (rome_count rome_0)

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

    (direct_flight rome lyon)
    (direct_flight lyon rome)
    (direct_flight rome zurich)
    (direct_flight zurich rome)

    (lyon_succ lyon_0 lyon_1)
    (lyon_succ lyon_1 lyon_2)
    (lyon_succ lyon_2 lyon_3)
    (lyon_succ lyon_3 lyon_4)
    (lyon_succ lyon_4 lyon_5)
    (lyon_succ lyon_5 lyon_6)

    (zurich_succ zurich_0 zurich_1)
    (zurich_succ zurich_1 zurich_2)
    (zurich_succ zurich_2 zurich_3)
    (zurich_succ zurich_3 zurich_4)
    (zurich_succ zurich_4 zurich_5)
    (zurich_succ zurich_5 zurich_6)
    (zurich_succ zurich_6 zurich_7)

    (rome_succ rome_0 rome_1)
    (rome_succ rome_1 rome_2)
    (rome_succ rome_2 rome_3)
    (rome_succ rome_3 rome_4)
    (rome_succ rome_4 rome_5)
    (rome_succ rome_5 rome_6)
  )

  (:goal
    (and
      (current_day day_17)
      (lyon_count lyon_6)
      (zurich_count zurich_7)
      (rome_count rome_6)
      (wedding_satisfied)
    )
  )
)