(define (problem trip_planning_example30_problem)
  (:domain trip_planning_example30)

  (:objects
    istanbul tallinn zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (direct istanbul tallinn)
    (direct istanbul zurich)
    (direct tallinn zurich)
    (direct tallinn istanbul)

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

    (at zurich day_1)
    (current_day day_1)
  )

  (:goal
    (and
      (at zurich day_1)
      (at zurich day_2)
      (at zurich day_3)
      (at zurich day_4)
      (at zurich day_5)
      (at zurich day_6)
      (at zurich day_7)

      (at istanbul day_8)
      (at istanbul day_9)
      (at istanbul day_10)
      (at istanbul day_11)
      (at istanbul day_12)

      (at tallinn day_13)
      (at tallinn day_14)
      (at tallinn day_3)
      (at tallinn day_4)
    )
  )
)