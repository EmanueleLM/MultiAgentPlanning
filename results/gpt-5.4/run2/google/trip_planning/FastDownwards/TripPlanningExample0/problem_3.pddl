(define (problem tripplanningexample0)
  (:domain european_trip_14_days)

  (:objects
    barcelona florence helsinki - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (at barcelona)
    (current_day d1)

    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight helsinki barcelona)
    (direct_flight barcelona helsinki)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)

    (friend_window_day d9)
    (friend_window_day d10)
    (friend_window_day d11)
    (friend_window_day d12)
    (friend_window_day d13)
    (friend_window_day d14)
  )

  (:goal
    (and
      (current_day d15)
      (friend_met)

      (visited_on barcelona d1)
      (visited_on barcelona d2)
      (visited_on barcelona d3)
      (visited_on barcelona d4)
      (visited_on barcelona d5)

      (visited_on helsinki d6)
      (visited_on helsinki d7)
      (visited_on helsinki d8)
      (visited_on helsinki d9)
      (visited_on helsinki d10)

      (visited_on florence d11)
      (visited_on florence d12)
      (visited_on florence d13)
      (visited_on florence d14)
      (visited_on florence d6)
      (visited_on florence d7)
    )
  )
)