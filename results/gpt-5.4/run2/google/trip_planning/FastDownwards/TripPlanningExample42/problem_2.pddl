(define (problem tripplanningexample42_problem)
  (:domain tripplanningexample42)

  (:objects
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct paris nice)
    (direct nice paris)
    (direct nice mykonos)
    (direct mykonos nice)

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

    (friends_window day_1)
    (friends_window day_2)
    (friends_window day_3)
    (friends_window day_4)

    (current_day day_1)
    (in_city paris)
  )

  (:goal
    (and
      (visited day_1)
      (visited day_2)
      (visited day_3)
      (visited day_4)
      (visited day_5)
      (visited day_6)
      (visited day_7)
      (visited day_8)
      (visited day_9)
      (visited day_10)
      (visited day_11)

      (met_friends)

      (at_on day_1 paris)
      (at_on day_2 paris)
      (at_on day_3 paris)
      (at_on day_4 paris)

      (at_on day_5 nice)
      (at_on day_6 nice)
      (at_on day_7 nice)
      (at_on day_8 nice)
      (at_on day_9 nice)

      (at_on day_10 mykonos)
      (at_on day_11 mykonos)
    )
  )
)