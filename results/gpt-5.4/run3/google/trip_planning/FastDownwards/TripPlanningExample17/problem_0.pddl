(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    copenhagen vienna lyon - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    copenhagen_day_1 copenhagen_day_2 copenhagen_day_3 copenhagen_day_4 copenhagen_day_5
    vienna_day_1 vienna_day_2 vienna_day_3 vienna_day_4
    lyon_day_1 lyon_day_2 lyon_day_3 lyon_day_4 - visit_token
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

    (current_day day_1)
    (current_city copenhagen)

    (direct_flight copenhagen vienna)
    (direct_flight vienna copenhagen)
    (direct_flight vienna lyon)
    (direct_flight lyon vienna)

    (final_day day_11)

    (token_for_city copenhagen_day_1 copenhagen)
    (token_for_city copenhagen_day_2 copenhagen)
    (token_for_city copenhagen_day_3 copenhagen)
    (token_for_city copenhagen_day_4 copenhagen)
    (token_for_city copenhagen_day_5 copenhagen)

    (token_for_city vienna_day_1 vienna)
    (token_for_city vienna_day_2 vienna)
    (token_for_city vienna_day_3 vienna)
    (token_for_city vienna_day_4 vienna)

    (token_for_city lyon_day_1 lyon)
    (token_for_city lyon_day_2 lyon)
    (token_for_city lyon_day_3 lyon)
    (token_for_city lyon_day_4 lyon)

    (token_unused copenhagen_day_1)
    (token_unused copenhagen_day_2)
    (token_unused copenhagen_day_3)
    (token_unused copenhagen_day_4)
    (token_unused copenhagen_day_5)

    (token_unused vienna_day_1)
    (token_unused vienna_day_2)
    (token_unused vienna_day_3)
    (token_unused vienna_day_4)

    (token_unused lyon_day_1)
    (token_unused lyon_day_2)
    (token_unused lyon_day_3)
    (token_unused lyon_day_4)
  )

  (:goal
    (and
      (trip_complete)
      (day_assigned day_11)
      (occupied day_1 copenhagen)
      (occupied day_5 copenhagen)

      (token_used copenhagen_day_1)
      (token_used copenhagen_day_2)
      (token_used copenhagen_day_3)
      (token_used copenhagen_day_4)
      (token_used copenhagen_day_5)

      (token_used vienna_day_1)
      (token_used vienna_day_2)
      (token_used vienna_day_3)
      (token_used vienna_day_4)

      (token_used lyon_day_1)
      (token_used lyon_day_2)
      (token_used lyon_day_3)
      (token_used lyon_day_4)
    )
  )
)