(define (problem tripplanningexample49_problem)
  (:domain tripplanningexample49)

  (:objects
    reykjavik milan split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (direct milan reykjavik)
    (direct reykjavik milan)
    (direct split milan)
    (direct milan split)

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

    (window_day day_1)
    (window_day day_2)
    (window_day day_3)

    (today day_1)
    (at split)
    (visited_on split day_1)
  )

  (:goal
    (and
      (finished)
      (window_satisfied)
    )
  )
)