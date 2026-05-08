(define (problem tripplanningexample24_problem)
  (:domain tripplanningexample24)

  (:objects
    florence amsterdam riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
    c0 c1 c2 c3 c4 c5 c6 - stay_count
  )

  (:init
    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

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

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)

    (workshop_window day_1)
    (workshop_window day_2)
    (workshop_window day_3)
    (workshop_window day_4)

    (at florence)
    (current_day day_1)

    (remaining_florence c0)
    (remaining_amsterdam c0)
    (remaining_riga c0)
  )

  (:goal
    (and
      (current_day day_14)
      (remaining_florence c4)
      (remaining_amsterdam c6)
      (remaining_riga c5)
      (workshop_done)
    )
  )
)