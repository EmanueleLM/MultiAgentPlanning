(define (problem european_trip_5_days_instance)
  (:domain european_trip_5_days)

  (:objects
    geneva madrid venice - city
    day1 day2 day3 day4 day5 - day
    geneva_slot1 geneva_slot2
    madrid_slot1 madrid_slot2 madrid_slot3
    venice_slot1 venice_slot2 - slot
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)

    (direct_flight geneva madrid)
    (direct_flight madrid geneva)
    (direct_flight madrid venice)
    (direct_flight venice madrid)

    (slot_for_city geneva_slot1 geneva)
    (slot_for_city geneva_slot2 geneva)
    (slot_for_city madrid_slot1 madrid)
    (slot_for_city madrid_slot2 madrid)
    (slot_for_city madrid_slot3 madrid)
    (slot_for_city venice_slot1 venice)
    (slot_for_city venice_slot2 venice)

    (slot_unused geneva_slot1)
    (slot_unused geneva_slot2)
    (slot_unused madrid_slot1)
    (slot_unused madrid_slot2)
    (slot_unused madrid_slot3)
    (slot_unused venice_slot1)
    (slot_unused venice_slot2)
  )

  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)

      (in_city day4 venice)
      (in_city day5 venice)

      (slot_used geneva_slot1)
      (slot_used geneva_slot2)
      (slot_used madrid_slot1)
      (slot_used madrid_slot2)
      (slot_used madrid_slot3)
      (slot_used venice_slot1)
      (slot_used venice_slot2)
    )
  )
)