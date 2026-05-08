(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    barcelona krakow rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )

  (:init
    (at barcelona)
    (day_now d1)

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

    (direct barcelona krakow)
    (direct krakow barcelona)
    (direct rome barcelona)
    (direct barcelona rome)

    (friend_window d10)
    (friend_window d11)
    (friend_window d12)
    (friend_window d13)
  )

  (:goal
    (and
      (day_now d14)
      (met_friend)

      (in_barcelona d1)
      (in_barcelona d2)
      (in_barcelona d3)
      (in_barcelona d4)
      (in_barcelona d5)
      (in_barcelona d6)
      (in_barcelona d7)

      (in_rome d8)
      (in_rome d9)
      (in_rome d10)
      (in_rome d11)

      (in_krakow d12)
      (in_krakow d13)
      (in_krakow d14)
      (in_krakow d10)
    )
  )
)