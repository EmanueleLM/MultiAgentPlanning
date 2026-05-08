(define (problem european_trip_14_days_instance_problem)
  (:domain european_trip_14_days_instance)

  (:objects
    amsterdam santorini istanbul - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (at amsterdam)
    (current_day day_1)
    (in_city_on amsterdam day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)

    (direct_flight amsterdam santorini)
    (direct_flight santorini amsterdam)
    (direct_flight amsterdam istanbul)
    (direct_flight istanbul amsterdam)
  )

  (:goal
    (and
      (current_day day_14)

      (in_city_on amsterdam day_1)
      (in_city_on amsterdam day_2)
      (in_city_on amsterdam day_3)
      (in_city_on amsterdam day_4)
      (in_city_on amsterdam day_5)
      (in_city_on amsterdam day_6)
      (in_city_on amsterdam day_7)

      (in_city_on istanbul day_8)
      (in_city_on istanbul day_9)
      (in_city_on istanbul day_10)
      (in_city_on istanbul day_11)
      (in_city_on istanbul day_12)
      (in_city_on istanbul day_13)

      (in_city_on santorini day_12)
      (in_city_on santorini day_13)
      (in_city_on santorini day_14)
    )
  )
)