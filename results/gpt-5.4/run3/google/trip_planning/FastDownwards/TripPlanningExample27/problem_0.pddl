(define (problem european_trip_14_days_instance_problem)
  (:domain european_trip_14_days_instance)

  (:objects
    amsterdam istanbul santorini - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (current_day day_1)

    (at amsterdam day_1)
    (at istanbul day_1)
    (at santorini day_1)

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

    (direct_flight amsterdam santorini)
    (direct_flight santorini amsterdam)
    (direct_flight istanbul amsterdam)
    (direct_flight amsterdam istanbul)
  )

  (:goal
    (and
      (current_day day_14)

      (at amsterdam day_1)
      (at amsterdam day_2)
      (at amsterdam day_3)
      (at amsterdam day_4)
      (at amsterdam day_5)
      (at amsterdam day_6)
      (at amsterdam day_7)

      (at istanbul day_8)
      (at istanbul day_9)
      (at istanbul day_10)
      (at istanbul day_11)
      (at istanbul day_12)
      (at istanbul day_13)

      (at santorini day_12)
      (at santorini day_13)
      (at santorini day_14)
    )
  )
)