(define (problem tripplanningexample11)
  (:domain tripplanningexample11_domain)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )

  (:init
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

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

    (current_day day_1)
  )

  (:goal
    (and
      (current_day day_15)

      (visited_on vienna day_1)
      (visited_on vienna day_2)
      (visited_on vienna day_3)
      (visited_on vienna day_4)
      (visited_on vienna day_5)

      (visited_on vilnius day_6)
      (visited_on vilnius day_7)
      (visited_on vilnius day_8)

      (visited_on valencia day_9)
      (visited_on valencia day_15)

      (visited_on vilnius day_10)
      (visited_on vilnius day_11)

      (visited_on valencia day_12)
      (visited_on valencia day_13)
      (visited_on valencia day_14)
    )
  )
)