(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    copenhagen vienna lyon - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    cph_0 cph_1 cph_2 cph_3 cph_4 cph_5 - copenhagen_count
    vie_0 vie_1 vie_2 vie_3 vie_4 - vienna_count
    lyo_0 lyo_1 lyo_2 lyo_3 lyo_4 - lyon_count
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
    (last_day day_11)

    (direct_flight copenhagen vienna)
    (direct_flight vienna copenhagen)
    (direct_flight vienna lyon)
    (direct_flight lyon vienna)

    (cph_count_at cph_0)
    (cph_next cph_0 cph_1)
    (cph_next cph_1 cph_2)
    (cph_next cph_2 cph_3)
    (cph_next cph_3 cph_4)
    (cph_next cph_4 cph_5)

    (vie_count_at vie_0)
    (vie_next vie_0 vie_1)
    (vie_next vie_1 vie_2)
    (vie_next vie_2 vie_3)
    (vie_next vie_3 vie_4)

    (lyo_count_at lyo_0)
    (lyo_next lyo_0 lyo_1)
    (lyo_next lyo_1 lyo_2)
    (lyo_next lyo_2 lyo_3)
    (lyo_next lyo_3 lyo_4)
  )

  (:goal
    (and
      (occupied day_1 copenhagen)
      (occupied day_5 copenhagen)
      (cph_count_at cph_5)
      (vie_count_at vie_4)
      (lyo_count_at lyo_4)
      (current_day day_11)
    )
  )
)