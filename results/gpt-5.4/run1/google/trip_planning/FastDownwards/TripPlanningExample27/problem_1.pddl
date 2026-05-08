(define (problem trip_planning_example27_problem)
  (:domain trip_planning_example27)

  (:objects
    amsterdam istanbul santorini - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
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

    (current_day day_1)

    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct istanbul amsterdam)
    (direct amsterdam istanbul)

    (santorini_window day_12)
    (santorini_window day_13)
    (santorini_window day_14)

    (need_amsterdam_1)
    (need_amsterdam_2)
    (need_amsterdam_3)
    (need_amsterdam_4)
    (need_amsterdam_5)
    (need_amsterdam_6)
    (need_amsterdam_7)

    (need_istanbul_1)
    (need_istanbul_2)
    (need_istanbul_3)
    (need_istanbul_4)
    (need_istanbul_5)
    (need_istanbul_6)

    (need_santorini_1)
    (need_santorini_2)
    (need_santorini_3)
  )

  (:goal
    (and
      (done)
    )
  )
)