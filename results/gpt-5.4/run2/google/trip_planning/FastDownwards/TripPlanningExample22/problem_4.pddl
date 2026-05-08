(define (problem tripplanningexample22_problem)
  (:domain tripplanningexample22)

  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct_flight berlin frankfurt)
    (direct_flight frankfurt berlin)
    (direct_flight frankfurt bucharest)
    (direct_flight bucharest frankfurt)

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

    (at berlin)
    (today day_1)
    (visited_on berlin day_1)
  )

  (:goal
    (and
      (today day_11)

      (visited_on berlin day_1)
      (visited_on berlin day_2)
      (visited_on berlin day_3)
      (visited_on berlin day_4)
      (visited_on berlin day_5)
      (visited_on berlin day_6)
      (visited_on berlin day_7)

      (visited_on frankfurt day_8)
      (visited_on frankfurt day_9)

      (visited_on bucharest day_10)
      (visited_on bucharest day_11)
    )
  )
)