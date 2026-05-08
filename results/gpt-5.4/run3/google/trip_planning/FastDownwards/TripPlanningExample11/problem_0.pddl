(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    vienna vilnius valencia - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day

    vienna_slot_1 vienna_slot_2 vienna_slot_3 vienna_slot_4 vienna_slot_5
    vilnius_slot_1 vilnius_slot_2 vilnius_slot_3 vilnius_slot_4 vilnius_slot_5
    valencia_slot_1 valencia_slot_2 valencia_slot_3 valencia_slot_4 valencia_slot_5 valencia_slot_6 valencia_slot_7 - count_slot
  )

  (:init
    (direct_flight vienna valencia)
    (direct_flight valencia vienna)
    (direct_flight vilnius vienna)
    (direct_flight vienna vilnius)

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

    (current_day day_1)

    (first_vienna_slot vienna_slot_1)
    (next_vienna_slot vienna_slot_1 vienna_slot_2)
    (next_vienna_slot vienna_slot_2 vienna_slot_3)
    (next_vienna_slot vienna_slot_3 vienna_slot_4)
    (next_vienna_slot vienna_slot_4 vienna_slot_5)
    (vienna_slot_available vienna_slot_1)

    (first_vilnius_slot vilnius_slot_1)
    (next_vilnius_slot vilnius_slot_1 vilnius_slot_2)
    (next_vilnius_slot vilnius_slot_2 vilnius_slot_3)
    (next_vilnius_slot vilnius_slot_3 vilnius_slot_4)
    (next_vilnius_slot vilnius_slot_4 vilnius_slot_5)
    (vilnius_slot_available vilnius_slot_1)

    (first_valencia_slot valencia_slot_1)
    (next_valencia_slot valencia_slot_1 valencia_slot_2)
    (next_valencia_slot valencia_slot_2 valencia_slot_3)
    (next_valencia_slot valencia_slot_3 valencia_slot_4)
    (next_valencia_slot valencia_slot_4 valencia_slot_5)
    (next_valencia_slot valencia_slot_5 valencia_slot_6)
    (next_valencia_slot valencia_slot_6 valencia_slot_7)
    (valencia_slot_available valencia_slot_1)
  )

  (:goal
    (and
      (day_assigned day_1)
      (day_assigned day_2)
      (day_assigned day_3)
      (day_assigned day_4)
      (day_assigned day_5)
      (day_assigned day_6)
      (day_assigned day_7)
      (day_assigned day_8)
      (day_assigned day_9)
      (day_assigned day_10)
      (day_assigned day_11)
      (day_assigned day_12)
      (day_assigned day_13)
      (day_assigned day_14)
      (day_assigned day_15)

      (at_city_on_day valencia day_9)
      (at_city_on_day valencia day_15)

      (vienna_slot_used vienna_slot_1)
      (vienna_slot_used vienna_slot_2)
      (vienna_slot_used vienna_slot_3)
      (vienna_slot_used vienna_slot_4)
      (vienna_slot_used vienna_slot_5)

      (vilnius_slot_used vilnius_slot_1)
      (vilnius_slot_used vilnius_slot_2)
      (vilnius_slot_used vilnius_slot_3)
      (vilnius_slot_used vilnius_slot_4)
      (vilnius_slot_used vilnius_slot_5)

      (valencia_slot_used valencia_slot_1)
      (valencia_slot_used valencia_slot_2)
      (valencia_slot_used valencia_slot_3)
      (valencia_slot_used valencia_slot_4)
      (valencia_slot_used valencia_slot_5)
      (valencia_slot_used valencia_slot_6)
      (valencia_slot_used valencia_slot_7)
    )
  )
)