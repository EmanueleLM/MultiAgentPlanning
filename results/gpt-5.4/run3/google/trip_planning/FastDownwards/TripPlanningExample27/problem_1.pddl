(define (problem trip_planning_example27_problem)
  (:domain trip_planning_example27)

  (:objects
    amsterdam istanbul santorini - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (current_day day_1)
    (at amsterdam day_1)

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

      (visited_relatives)
    )
  )
)