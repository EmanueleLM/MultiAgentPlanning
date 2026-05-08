(define (problem european_trip_17_days_instance_problem)
  (:domain european_trip_17_days_instance)

  (:objects
    rome lyon zurich - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day

    rome_slot_1 rome_slot_2 rome_slot_3 rome_slot_4 rome_slot_5 rome_slot_6
    lyon_slot_1 lyon_slot_2 lyon_slot_3 lyon_slot_4 lyon_slot_5 lyon_slot_6
    zurich_slot_1 zurich_slot_2 zurich_slot_3 zurich_slot_4 zurich_slot_5 zurich_slot_6 zurich_slot_7 - visit_slot
  )

  (:init
    (start_pending)
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

    (slot_for_city rome_slot_1 rome)
    (slot_for_city rome_slot_2 rome)
    (slot_for_city rome_slot_3 rome)
    (slot_for_city rome_slot_4 rome)
    (slot_for_city rome_slot_5 rome)
    (slot_for_city rome_slot_6 rome)

    (slot_for_city lyon_slot_1 lyon)
    (slot_for_city lyon_slot_2 lyon)
    (slot_for_city lyon_slot_3 lyon)
    (slot_for_city lyon_slot_4 lyon)
    (slot_for_city lyon_slot_5 lyon)
    (slot_for_city lyon_slot_6 lyon)

    (slot_for_city zurich_slot_1 zurich)
    (slot_for_city zurich_slot_2 zurich)
    (slot_for_city zurich_slot_3 zurich)
    (slot_for_city zurich_slot_4 zurich)
    (slot_for_city zurich_slot_5 zurich)
    (slot_for_city zurich_slot_6 zurich)
    (slot_for_city zurich_slot_7 zurich)

    (slot_unused rome_slot_1)
    (slot_unused rome_slot_2)
    (slot_unused rome_slot_3)
    (slot_unused rome_slot_4)
    (slot_unused rome_slot_5)
    (slot_unused rome_slot_6)

    (slot_unused lyon_slot_1)
    (slot_unused lyon_slot_2)
    (slot_unused lyon_slot_3)
    (slot_unused lyon_slot_4)
    (slot_unused lyon_slot_5)
    (slot_unused lyon_slot_6)

    (slot_unused zurich_slot_1)
    (slot_unused zurich_slot_2)
    (slot_unused zurich_slot_3)
    (slot_unused zurich_slot_4)
    (slot_unused zurich_slot_5)
    (slot_unused zurich_slot_6)
    (slot_unused zurich_slot_7)
  )

  (:goal
    (and
      (not (slot_unused rome_slot_1))
      (not (slot_unused rome_slot_2))
      (not (slot_unused rome_slot_3))
      (not (slot_unused rome_slot_4))
      (not (slot_unused rome_slot_5))
      (not (slot_unused rome_slot_6))

      (not (slot_unused lyon_slot_1))
      (not (slot_unused lyon_slot_2))
      (not (slot_unused lyon_slot_3))
      (not (slot_unused lyon_slot_4))
      (not (slot_unused lyon_slot_5))
      (not (slot_unused lyon_slot_6))

      (not (slot_unused zurich_slot_1))
      (not (slot_unused zurich_slot_2))
      (not (slot_unused zurich_slot_3))
      (not (slot_unused zurich_slot_4))
      (not (slot_unused zurich_slot_5))
      (not (slot_unused zurich_slot_6))
      (not (slot_unused zurich_slot_7))

      (day_counted day_17)
      (wedding_attended)
    )
  )
)