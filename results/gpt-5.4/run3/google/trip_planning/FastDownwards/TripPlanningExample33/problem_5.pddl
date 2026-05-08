(define (problem tripplanningexample33_problem)
  (:domain tripplanningexample33_domain)

  (:objects
    barcelona krakow rome - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (free_start)
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

    (direct barcelona krakow)
    (direct krakow barcelona)
    (direct rome barcelona)
    (direct barcelona rome)

    (friend_window day_10)
    (friend_window day_11)
    (friend_window day_12)
    (friend_window day_13)
  )

  (:goal
    (and
      (current_day day_13)
      (met_friend)

      (stay barcelona day_1)
      (stay barcelona day_2)
      (stay barcelona day_3)
      (stay barcelona day_4)
      (stay barcelona day_5)
      (stay barcelona day_6)
      (stay barcelona day_7)

      (stay rome day_8)
      (stay rome day_9)
      (stay rome day_10)
      (stay rome day_11)

      (stay krakow day_10)
      (stay krakow day_11)
      (stay krakow day_12)
      (stay krakow day_13)
    )
  )
)