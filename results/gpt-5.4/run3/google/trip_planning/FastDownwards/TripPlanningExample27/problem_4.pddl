(define (problem trip_planning_example27_problem)
  (:domain trip_planning_example27)

  (:objects
    amsterdam istanbul santorini - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (at amsterdam)
    (current_day day_1)
    (visited_day amsterdam day_1)

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

    (in_relatives_window day_12)
    (in_relatives_window day_13)
    (in_relatives_window day_14)
  )

  (:goal
    (and
      (current_day day_14)

      (visited_day amsterdam day_1)
      (visited_day amsterdam day_2)
      (visited_day amsterdam day_3)
      (visited_day amsterdam day_4)
      (visited_day amsterdam day_5)
      (visited_day amsterdam day_6)
      (visited_day amsterdam day_7)

      (visited_day istanbul day_8)
      (visited_day istanbul day_9)
      (visited_day istanbul day_10)
      (visited_day istanbul day_11)
      (visited_day istanbul day_12)
      (visited_day istanbul day_13)

      (visited_day santorini day_12)
      (visited_day santorini day_13)
      (visited_day santorini day_14)

      (relatives_visited)
    )
  )
)