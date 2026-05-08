(define (problem europe_trip_16_days_instance_problem)
  (:domain europe_trip_16_days_instance)

  (:objects
    athens zurich krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (direct zurich krakow)
    (direct krakow zurich)
    (direct athens zurich)
    (direct zurich athens)

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

    (current_day day_1)
    (start_unset)

    (krakow_count_0)
    (zurich_count_0)
  )

  (:goal
    (and
      (current_day day_16)
      (counted day_16)

      (spent_in athens day_1)
      (spent_in athens day_2)
      (spent_in athens day_3)
      (spent_in athens day_4)
      (spent_in athens day_5)
      (spent_in athens day_6)
      (spent_in athens day_7)

      (krakow_count_6)
      (zurich_count_5)
    )
  )
)