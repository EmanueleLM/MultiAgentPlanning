(define (problem trip_planning_example27_problem)
  (:domain trip_planning_example27)

  (:objects
    amsterdam istanbul santorini - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (at amsterdam)
    (current_day day_1)
    (day_in_city day_1 amsterdam)

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
    (direct amsterdam istanbul)
    (direct istanbul amsterdam)

    (relatives_window day_12)
    (relatives_window day_13)
    (relatives_window day_14)
  )

  (:goal
    (and
      (current_day day_14)

      (day_in_city day_1 amsterdam)
      (day_in_city day_2 amsterdam)
      (day_in_city day_3 amsterdam)
      (day_in_city day_4 amsterdam)
      (day_in_city day_5 amsterdam)
      (day_in_city day_6 amsterdam)
      (day_in_city day_7 amsterdam)

      (day_in_city day_8 istanbul)
      (day_in_city day_9 istanbul)
      (day_in_city day_10 istanbul)
      (day_in_city day_11 istanbul)
      (day_in_city day_12 istanbul)
      (day_in_city day_13 istanbul)

      (day_in_city day_14 santorini)

      (visited_relatives)
    )
  )
)