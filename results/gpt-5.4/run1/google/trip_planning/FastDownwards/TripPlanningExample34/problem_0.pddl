(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day

    frankfurt_d1 frankfurt_d2 frankfurt_d3 frankfurt_d4 frankfurt_d5
    florence_d1 florence_d2 florence_d3 florence_d4
    valencia_d1 valencia_d2 - stay_token
  )

  (:init
    (direct_flight frankfurt florence)
    (direct_flight florence frankfurt)
    (direct_flight valencia frankfurt)
    (direct_flight frankfurt valencia)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (current_day day_1)
    (at valencia)
    (in_valencia_day1)

    (token_for_city frankfurt_d1 frankfurt)
    (token_for_city frankfurt_d2 frankfurt)
    (token_for_city frankfurt_d3 frankfurt)
    (token_for_city frankfurt_d4 frankfurt)
    (token_for_city frankfurt_d5 frankfurt)

    (token_for_city florence_d1 florence)
    (token_for_city florence_d2 florence)
    (token_for_city florence_d3 florence)
    (token_for_city florence_d4 florence)

    (token_for_city valencia_d1 valencia)
    (token_for_city valencia_d2 valencia)

    (unused frankfurt_d1)
    (unused frankfurt_d2)
    (unused frankfurt_d3)
    (unused frankfurt_d4)
    (unused frankfurt_d5)

    (unused florence_d1)
    (unused florence_d2)
    (unused florence_d3)
    (unused florence_d4)

    (unused valencia_d1)
    (unused valencia_d2)
  )

  (:goal
    (and
      (current_day day_10)

      (used frankfurt_d1)
      (used frankfurt_d2)
      (used frankfurt_d3)
      (used frankfurt_d4)
      (used frankfurt_d5)

      (used florence_d1)
      (used florence_d2)
      (used florence_d3)
      (used florence_d4)

      (used valencia_d1)
      (used valencia_d2)

      (in_valencia_day2)
    )
  )
)