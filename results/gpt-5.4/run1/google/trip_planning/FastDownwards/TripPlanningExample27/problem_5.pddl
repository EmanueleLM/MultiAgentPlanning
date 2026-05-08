(define (problem trip_planning_example27_problem)
  (:domain trip_planning_example27)

  (:objects
    amsterdam istanbul santorini - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (current_day day_1)

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

    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct istanbul amsterdam)
    (direct amsterdam istanbul)
  )

  (:goal
    (and
      (spent day_1 istanbul)
      (spent day_2 istanbul)
      (spent day_3 istanbul)
      (spent day_4 istanbul)
      (spent day_5 istanbul)
      (spent day_6 istanbul)

      (spent day_7 amsterdam)
      (spent day_8 amsterdam)
      (spent day_9 amsterdam)
      (spent day_10 amsterdam)
      (spent day_11 amsterdam)
      (spent day_12 amsterdam)
      (spent day_13 amsterdam)

      (spent day_12 santorini)
      (spent day_13 santorini)
      (spent day_14 santorini)

      (current_day day_14)
    )
  )
)