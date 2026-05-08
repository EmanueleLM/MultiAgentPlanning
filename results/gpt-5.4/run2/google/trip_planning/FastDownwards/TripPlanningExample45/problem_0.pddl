(define (problem european_trip_16_days_instance_problem)
  (:domain european_trip_16_days_instance)

  (:objects
    copenhagen lisbon florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (current_day day_1)
    (at copenhagen)
    (visited_on copenhagen day_1)

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

    (direct_flight copenhagen lisbon)
    (direct_flight lisbon copenhagen)
    (direct_flight lisbon florence)
    (direct_flight florence lisbon)
  )

  (:goal
    (and
      (current_day day_16)

      (visited_on copenhagen day_1)
      (visited_on copenhagen day_2)
      (visited_on copenhagen day_3)
      (visited_on copenhagen day_4)
      (visited_on copenhagen day_5)
      (visited_on copenhagen day_6)
      (visited_on copenhagen day_7)

      (visited_on lisbon day_8)
      (visited_on lisbon day_9)
      (visited_on lisbon day_10)
      (visited_on lisbon day_11)
      (visited_on lisbon day_12)
      (visited_on lisbon day_13)
      (visited_on lisbon day_14)

      (visited_on florence day_13)
      (visited_on florence day_14)
      (visited_on florence day_15)
      (visited_on florence day_16)
    )
  )
)