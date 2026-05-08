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
      (required_city day_1 split)
      (required_city day_2 split)
      (required_city day_3 split)
      (required_city day_4 reykjavik)
      (required_city day_5 reykjavik)
      (required_city day_6 reykjavik)
      (required_city day_7 reykjavik)
      (required_city day_8 milan)
      (required_city day_9 milan)
      (required_city day_10 milan)
      (required_city day_11 milan)
      (required_city day_12 milan)
      (required_city day_13 milan)
      (window_satisfied)
    )
  )
)