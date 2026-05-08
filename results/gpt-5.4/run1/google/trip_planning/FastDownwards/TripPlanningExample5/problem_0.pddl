(define (problem european_trip_16_days_instance)
  (:domain european_trip_16_days)

  (:objects
    oslo porto dubrovnik - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day

    oslo_day_1 oslo_day_2 oslo_day_3 oslo_day_4 oslo_day_5 oslo_day_6
    porto_day_1 porto_day_2 porto_day_3 porto_day_4 porto_day_5 porto_day_6 porto_day_7
    dubrovnik_day_1 dubrovnik_day_2 dubrovnik_day_3 dubrovnik_day_4 dubrovnik_day_5 - token
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
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)

    (direct_flight oslo dubrovnik)
    (direct_flight dubrovnik oslo)
    (direct_flight porto oslo)
    (direct_flight oslo porto)

    (token_for_city oslo_day_1 oslo)
    (token_for_city oslo_day_2 oslo)
    (token_for_city oslo_day_3 oslo)
    (token_for_city oslo_day_4 oslo)
    (token_for_city oslo_day_5 oslo)
    (token_for_city oslo_day_6 oslo)

    (token_for_city porto_day_1 porto)
    (token_for_city porto_day_2 porto)
    (token_for_city porto_day_3 porto)
    (token_for_city porto_day_4 porto)
    (token_for_city porto_day_5 porto)
    (token_for_city porto_day_6 porto)
    (token_for_city porto_day_7 porto)

    (token_for_city dubrovnik_day_1 dubrovnik)
    (token_for_city dubrovnik_day_2 dubrovnik)
    (token_for_city dubrovnik_day_3 dubrovnik)
    (token_for_city dubrovnik_day_4 dubrovnik)
    (token_for_city dubrovnik_day_5 dubrovnik)

    (unused oslo_day_1)
    (unused oslo_day_2)
    (unused oslo_day_3)
    (unused oslo_day_4)
    (unused oslo_day_5)
    (unused oslo_day_6)

    (unused porto_day_1)
    (unused porto_day_2)
    (unused porto_day_3)
    (unused porto_day_4)
    (unused porto_day_5)
    (unused porto_day_6)
    (unused porto_day_7)

    (unused dubrovnik_day_1)
    (unused dubrovnik_day_2)
    (unused dubrovnik_day_3)
    (unused dubrovnik_day_4)
    (unused dubrovnik_day_5)
  )

  (:goal
    (and
      (current_day day_16)

      (occupied day_12 dubrovnik)
      (occupied day_16 dubrovnik)

      (used oslo_day_1)
      (used oslo_day_2)
      (used oslo_day_3)
      (used oslo_day_4)
      (used oslo_day_5)
      (used oslo_day_6)

      (used porto_day_1)
      (used porto_day_2)
      (used porto_day_3)
      (used porto_day_4)
      (used porto_day_5)
      (used porto_day_6)
      (used porto_day_7)

      (used dubrovnik_day_1)
      (used dubrovnik_day_2)
      (used dubrovnik_day_3)
      (used dubrovnik_day_4)
      (used dubrovnik_day_5)
    )
  )
)