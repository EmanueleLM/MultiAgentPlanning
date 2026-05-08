(define (problem european_trip_15_days_instance)
  (:domain european_trip_15_days)

  (:objects
    riga manchester split - city

    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - stage

    riga_day_1 riga_day_2 riga_day_3 riga_day_4 riga_day_5 riga_day_6 riga_day_7
    manchester_day_1 manchester_day_2 manchester_day_3 manchester_day_4
    split_day_1 split_day_2 split_day_3 split_day_4 split_day_5 split_day_6 - stay_slot
  )

  (:init
    (current d0)

    (next_stage d0 d1)
    (next_stage d1 d2)
    (next_stage d2 d3)
    (next_stage d3 d4)
    (next_stage d4 d5)
    (next_stage d5 d6)
    (next_stage d6 d7)
    (next_stage d7 d8)
    (next_stage d8 d9)
    (next_stage d9 d10)
    (next_stage d10 d11)
    (next_stage d11 d12)
    (next_stage d12 d13)
    (next_stage d13 d14)
    (next_stage d14 d15)

    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)

    (same_city riga)
    (same_city manchester)
    (same_city split)

    (slot_for_city riga_day_1 riga)
    (slot_for_city riga_day_2 riga)
    (slot_for_city riga_day_3 riga)
    (slot_for_city riga_day_4 riga)
    (slot_for_city riga_day_5 riga)
    (slot_for_city riga_day_6 riga)
    (slot_for_city riga_day_7 riga)

    (slot_for_city manchester_day_1 manchester)
    (slot_for_city manchester_day_2 manchester)
    (slot_for_city manchester_day_3 manchester)
    (slot_for_city manchester_day_4 manchester)

    (slot_for_city split_day_1 split)
    (slot_for_city split_day_2 split)
    (slot_for_city split_day_3 split)
    (slot_for_city split_day_4 split)
    (slot_for_city split_day_5 split)
    (slot_for_city split_day_6 split)

    (slot_unused riga_day_1)
    (slot_unused riga_day_2)
    (slot_unused riga_day_3)
    (slot_unused riga_day_4)
    (slot_unused riga_day_5)
    (slot_unused riga_day_6)
    (slot_unused riga_day_7)

    (slot_unused manchester_day_1)
    (slot_unused manchester_day_2)
    (slot_unused manchester_day_3)
    (slot_unused manchester_day_4)

    (slot_unused split_day_1)
    (slot_unused split_day_2)
    (slot_unused split_day_3)
    (slot_unused split_day_4)
    (slot_unused split_day_5)
    (slot_unused split_day_6)
  )

  (:goal
    (and
      (start_chosen)
      (current d15)

      (day_assigned d1)
      (day_assigned d2)
      (day_assigned d3)
      (day_assigned d4)
      (day_assigned d5)
      (day_assigned d6)
      (day_assigned d7)
      (day_assigned d8)
      (day_assigned d9)
      (day_assigned d10)
      (day_assigned d11)
      (day_assigned d12)
      (day_assigned d13)
      (day_assigned d14)
      (day_assigned d15)

      (slot_used riga_day_1)
      (slot_used riga_day_2)
      (slot_used riga_day_3)
      (slot_used riga_day_4)
      (slot_used riga_day_5)
      (slot_used riga_day_6)
      (slot_used riga_day_7)

      (slot_used manchester_day_1)
      (slot_used manchester_day_2)
      (slot_used manchester_day_3)
      (slot_used manchester_day_4)

      (slot_used split_day_1)
      (slot_used split_day_2)
      (slot_used split_day_3)
      (slot_used split_day_4)
      (slot_used split_day_5)
      (slot_used split_day_6)
    )
  )
)