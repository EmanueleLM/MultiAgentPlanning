(define (problem trip_planning_example12_problem)
  (:domain trip_planning_example12)

  (:objects
    amsterdam valencia tallinn - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
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
    (next day_14 day_15)

    (direct amsterdam tallinn)
    (direct tallinn amsterdam)
    (direct valencia amsterdam)
    (direct amsterdam valencia)

    (in_window day_9)
    (in_window day_10)
    (in_window day_11)
    (in_window day_12)
    (in_window day_13)
    (in_window day_14)
    (in_window day_15)
  )

  (:goal
    (and
      (friend_met)
      (visit_day valencia day_1)
      (visit_day valencia day_2)
      (visit_day valencia day_3)
      (visit_day valencia day_4)
      (visit_day valencia day_5)
      (visit_day amsterdam day_6)
      (visit_day amsterdam day_7)
      (visit_day amsterdam day_8)
      (visit_day amsterdam day_9)
      (visit_day amsterdam day_10)
      (visit_day tallinn day_11)
      (visit_day tallinn day_12)
      (visit_day tallinn day_13)
      (visit_day tallinn day_14)
      (visit_day tallinn day_15)
    )
  )
)