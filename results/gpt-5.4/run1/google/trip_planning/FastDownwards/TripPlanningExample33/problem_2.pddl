(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    barcelona krakow rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )

  (:init
    (at barcelona)
    (current_day d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)

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
      (current_day d14)
      (met_friend)

      (spent d1 barcelona)
      (spent d2 barcelona)
      (spent d3 barcelona)
      (spent d4 barcelona)
      (spent d5 barcelona)
      (spent d6 barcelona)
      (spent d7 barcelona)

      (spent d8 rome)
      (spent d9 rome)
      (spent d10 rome)
      (spent d11 rome)

      (spent d12 krakow)
      (spent d13 krakow)
    )
  )
)