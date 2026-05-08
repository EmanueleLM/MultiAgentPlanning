(define (problem european_trip_16_days_instance_problem)
  (:domain european_trip_16_days_instance)

  (:objects
    copenhagen lisbon florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
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

    (direct_flight copenhagen lisbon)
    (direct_flight lisbon copenhagen)
    (direct_flight lisbon florence)
    (direct_flight florence lisbon)

    (current_day day_1)
    (at_on day_1 copenhagen)
  )

  (:goal
    (and
      (current_day day_16)

      (at_on day_1 copenhagen)
      (at_on day_7 copenhagen)

      (at_on day_2 copenhagen)
      (at_on day_3 copenhagen)
      (at_on day_4 copenhagen)
      (at_on day_5 copenhagen)
      (at_on day_6 copenhagen)
      (at_on day_8 copenhagen)

      (at_on day_9 lisbon)
      (at_on day_10 lisbon)
      (at_on day_11 lisbon)
      (at_on day_12 lisbon)
      (at_on day_13 lisbon)
      (at_on day_14 lisbon)
      (at_on day_15 lisbon)

      (at_on day_16 florence)
      (at_on day_5 florence)
      (at_on day_6 florence)
      (at_on day_8 florence)
    )
  )
)