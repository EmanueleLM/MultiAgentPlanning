(define (problem european_trip_11_days_instance)
  (:domain european_trip_11_days)

  (:objects
    dubrovnik istanbul venice - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day

    venice_0 venice_1 venice_2 venice_3 venice_4 venice_5 venice_6
    dubrovnik_0 dubrovnik_1 dubrovnik_2 dubrovnik_3 dubrovnik_4
    istanbul_0 istanbul_1 istanbul_2 istanbul_3 - count
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

    (direct_flight dubrovnik istanbul)
    (direct_flight istanbul dubrovnik)
    (direct_flight dubrovnik venice)
    (direct_flight venice dubrovnik)

    (venice_next_count venice_0 venice_1)
    (venice_next_count venice_1 venice_2)
    (venice_next_count venice_2 venice_3)
    (venice_next_count venice_3 venice_4)
    (venice_next_count venice_4 venice_5)
    (venice_next_count venice_5 venice_6)

    (dubrovnik_next_count dubrovnik_0 dubrovnik_1)
    (dubrovnik_next_count dubrovnik_1 dubrovnik_2)
    (dubrovnik_next_count dubrovnik_2 dubrovnik_3)
    (dubrovnik_next_count dubrovnik_3 dubrovnik_4)

    (istanbul_next_count istanbul_0 istanbul_1)
    (istanbul_next_count istanbul_1 istanbul_2)
    (istanbul_next_count istanbul_2 istanbul_3)

    (current_day day_1)

    (at dubrovnik)

    (venice_count_at venice_0)
    (dubrovnik_count_at dubrovnik_0)
    (istanbul_count_at istanbul_0)
  )

  (:goal
    (and
      (current_day day_12)
      (venice_count_at venice_6)
      (dubrovnik_count_at dubrovnik_4)
      (istanbul_count_at istanbul_3)
    )
  )
)