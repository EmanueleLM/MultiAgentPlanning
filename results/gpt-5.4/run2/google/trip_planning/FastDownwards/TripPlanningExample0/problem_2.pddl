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
    (last_day d15)

    (must_meet_day d9)
    (must_meet_day d10)
    (must_meet_day d11)
    (must_meet_day d12)
    (must_meet_day d13)
    (must_meet_day d14)
  )

  (:goal
    (and
      (current_day d15)
      (friend_met)

      (barcelona_day_done d1)
      (barcelona_day_done d2)
      (barcelona_day_done d3)
      (barcelona_day_done d4)
      (barcelona_day_done d5)

      (florence_day_done d6)
      (florence_day_done d7)
      (florence_day_done d8)
      (florence_day_done d9)
      (florence_day_done d10)
      (florence_day_done d11)

      (helsinki_day_done d12)
      (helsinki_day_done d13)
      (helsinki_day_done d14)
      (helsinki_day_done d8)
      (helsinki_day_done d9)
    )
  )
)