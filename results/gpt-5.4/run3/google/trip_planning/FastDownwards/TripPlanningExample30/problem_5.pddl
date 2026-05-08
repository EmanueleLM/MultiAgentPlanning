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

    (at zurich day_1)
    (current_day day_1)
  )

  (:goal
    (and
      (current_day day_14)

      (at zurich day_1)
      (at zurich day_2)
      (at zurich day_3)
      (at zurich day_4)
      (at zurich day_5)
      (at zurich day_6)
      (at zurich day_7)

      (at tallinn day_8)
      (at tallinn day_9)
      (at tallinn day_10)
      (at tallinn day_11)

      (at istanbul day_12)
      (at istanbul day_13)
      (at istanbul day_14)
    )
  )
)