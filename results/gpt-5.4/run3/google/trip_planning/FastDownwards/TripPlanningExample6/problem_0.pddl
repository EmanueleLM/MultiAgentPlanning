(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    berlin munich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (current_day day_1)
    (at berlin)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)

    (direct munich dubrovnik)
    (direct dubrovnik munich)
    (direct berlin munich)
    (direct munich berlin)

    (requires_berlin day_4)
  )

  (:goal
    (and
      (berlin_slot_1_used)
      (berlin_slot_2_used)
      (berlin_slot_3_used)
      (berlin_slot_4_used)

      (munich_slot_1_used)
      (munich_slot_2_used)
      (munich_slot_3_used)

      (dubrovnik_slot_1_used)
      (dubrovnik_slot_2_used)
      (dubrovnik_slot_3_used)

      (current_day day_8)
      (day_counted day_8)
    )
  )
)