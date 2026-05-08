(define (problem european_trip_14_days_instance_problem)
  (:domain european_trip_14_days_instance)

  (:objects
    amsterdam santorini istanbul - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (at amsterdam)
    (current_day day_1)
    (occupied amsterdam day_1)

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
    (direct_flight amsterdam istanbul)
    (direct_flight istanbul amsterdam)
  )

  (:goal
    (and
      (current_day day_14)

      (occupied amsterdam day_1)
      (occupied amsterdam day_2)
      (occupied amsterdam day_3)
      (occupied amsterdam day_4)
      (occupied amsterdam day_5)
      (occupied amsterdam day_6)
      (occupied amsterdam day_7)

      (occupied istanbul day_8)
      (occupied istanbul day_9)
      (occupied istanbul day_10)
      (occupied istanbul day_11)
      (occupied istanbul day_12)
      (occupied istanbul day_13)

      (occupied santorini day_12)
      (occupied santorini day_13)
      (occupied santorini day_14)

      (visited_santorini_window)
    )
  )
)