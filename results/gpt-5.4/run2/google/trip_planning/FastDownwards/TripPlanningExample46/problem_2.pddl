(define (problem tripplanningexample46_problem)
  (:domain tripplanningexample46)

  (:objects
    seville manchester stockholm - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (at stockholm)
    (current_day day_1)
    (day_city day_1 stockholm)

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

    (direct manchester seville)
    (direct seville manchester)
    (direct stockholm manchester)
    (direct manchester stockholm)
  )

  (:goal
    (and
      (current_day day_11)

      (day_city day_1 stockholm)
      (day_city day_2 stockholm)
      (day_city day_3 stockholm)

      (day_city day_4 manchester)
      (day_city day_5 manchester)
      (day_city day_6 manchester)
      (day_city day_7 manchester)
      (day_city day_8 manchester)

      (day_city day_9 seville)
      (day_city day_10 seville)
      (day_city day_11 seville)
    )
  )
)