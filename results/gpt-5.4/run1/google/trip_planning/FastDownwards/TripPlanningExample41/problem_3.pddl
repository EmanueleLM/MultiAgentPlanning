(define (problem tripplanningexample41_problem)
  (:domain tripplanningexample41_domain)

  (:objects
    stockholm athens mykonos - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (direct athens mykonos)
    (direct mykonos athens)
    (direct stockholm athens)
    (direct athens stockholm)

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

    (current_day day_1)
    (at stockholm)
    (visited day_1 stockholm)
  )

  (:goal
    (and
      (current_day day_13)

      (visited day_1 stockholm)
      (visited day_6 stockholm)

      (visited day_2 stockholm)
      (visited day_3 stockholm)
      (visited day_4 stockholm)
      (visited day_5 stockholm)

      (visited day_7 athens)
      (visited day_8 athens)
      (visited day_9 athens)
      (visited day_10 athens)
      (visited day_11 mykonos)
      (visited day_12 mykonos)
      (visited day_13 mykonos)
    )
  )
)