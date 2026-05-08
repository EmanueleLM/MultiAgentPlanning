(define (problem tripplanningexample24_problem)
  (:domain tripplanningexample24)

  (:objects
    florence amsterdam riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
    c0 c1 c2 c3 c4 c5 c6 - count
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

    (decrease c6 c5)
    (decrease c5 c4)
    (decrease c4 c3)
    (decrease c3 c2)
    (decrease c2 c1)
    (decrease c1 c0)

    (workshop_window day_1)
    (workshop_window day_2)
    (workshop_window day_3)
    (workshop_window day_4)

    (at florence)
    (current_day day_1)

    (florence_left c4)
    (amsterdam_left c6)
    (riga_left c5)
  )

  (:goal
    (and
      (current_day day_14)
      (florence_left c0)
      (amsterdam_left c0)
      (riga_left c0)
      (workshop_done)
    )
  )
)