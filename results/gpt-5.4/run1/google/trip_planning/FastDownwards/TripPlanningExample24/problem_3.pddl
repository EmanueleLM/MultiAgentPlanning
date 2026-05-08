(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    florence amsterdam riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (at florence)

    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

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

    (workshop_window day_1)
    (workshop_window day_2)
    (workshop_window day_3)
    (workshop_window day_4)
  )

  (:goal
    (and
      (current_day day_14)
      (workshop_attended)

      (visited_on florence day_1)
      (visited_on florence day_2)
      (visited_on florence day_3)
      (visited_on florence day_4)

      (visited_on amsterdam day_5)
      (visited_on amsterdam day_6)
      (visited_on amsterdam day_7)
      (visited_on amsterdam day_8)
      (visited_on amsterdam day_9)
      (visited_on amsterdam day_10)

      (visited_on riga day_9)
      (visited_on riga day_10)
      (visited_on riga day_11)
      (visited_on riga day_12)
      (visited_on riga day_13)
    )
  )
)