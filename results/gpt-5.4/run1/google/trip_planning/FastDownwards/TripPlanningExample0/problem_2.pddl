(define (problem tripplanningexample0)
  (:domain european_trip_14_days)

  (:objects
    barcelona florence helsinki - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (current_day day_1)

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

    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight helsinki barcelona)
    (direct_flight barcelona helsinki)

    (friend_window day_9)
    (friend_window day_10)
    (friend_window day_11)
    (friend_window day_12)
    (friend_window day_13)
    (friend_window day_14)
  )

  (:goal
    (and
      (current_day day_14)
      (met_friend)

      (visited_on florence day_1)
      (visited_on florence day_2)
      (visited_on florence day_3)
      (visited_on florence day_4)
      (visited_on florence day_5)
      (visited_on florence day_6)

      (visited_on barcelona day_7)
      (visited_on barcelona day_8)
      (visited_on barcelona day_9)
      (visited_on barcelona day_10)
      (visited_on barcelona day_11)

      (visited_on helsinki day_10)
      (visited_on helsinki day_11)
      (visited_on helsinki day_12)
      (visited_on helsinki day_13)
      (visited_on helsinki day_14)
    )
  )
)