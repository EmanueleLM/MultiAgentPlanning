(define (problem tripplanningexample0)
  (:domain european_trip_14_days)

  (:objects
    barcelona helsinki - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (at barcelona)
    (current_day d1)

    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight barcelona helsinki)
    (direct_flight helsinki barcelona)

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

    (in_friend_window d9)
    (in_friend_window d10)
    (in_friend_window d11)
    (in_friend_window d12)
    (in_friend_window d13)
    (in_friend_window d14)
  )

  (:goal
    (and
      (current_day d15)
      (friend_met)

      (visited barcelona d1)
      (visited barcelona d2)
      (visited barcelona d3)
      (visited barcelona d4)
      (visited barcelona d5)

      (visited helsinki d6)
      (visited helsinki d7)
      (visited helsinki d8)
      (visited helsinki d9)
      (visited helsinki d10)

      (visited florence d11)
      (visited florence d12)
      (visited florence d13)
      (visited florence d14)
    )
  )
)