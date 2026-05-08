(define (problem tripplanningexample18)
  (:domain european_trip_11_days)

  (:objects
    amsterdam vilnius bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct amsterdam vilnius)
    (direct vilnius amsterdam)

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

    (friend_window day_6)
    (friend_window day_7)
    (friend_window day_8)
    (friend_window day_9)
    (friend_window day_10)
    (friend_window day_11)

    (current_day day_1)
  )

  (:goal
    (and
      (current_day day_11)

      (at amsterdam day_1)
      (at amsterdam day_2)
      (at amsterdam day_3)
      (at amsterdam day_4)
      (at amsterdam day_5)

      (at vilnius day_6)
      (at vilnius day_7)

      (at bucharest day_6)
      (at bucharest day_7)
      (at bucharest day_8)
      (at bucharest day_9)
      (at bucharest day_10)
      (at bucharest day_11)

      (met_friends)
    )
  )
)