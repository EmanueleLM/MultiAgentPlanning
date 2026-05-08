(define (problem tripplanningexample33)
  (:domain european_trip_13_days)

  (:objects
    barcelona krakow rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (current d1)
    (last_day d13)

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

    (direct barcelona krakow)
    (direct krakow barcelona)
    (direct rome barcelona)
    (direct barcelona rome)

    (meeting_day d10)
    (meeting_day d11)
    (meeting_day d12)
    (meeting_day d13)
  )

  (:goal
    (and
      (current d13)
      (visited barcelona d1)
      (visited barcelona d2)
      (visited barcelona d3)
      (visited barcelona d4)
      (visited barcelona d5)
      (visited barcelona d6)
      (visited barcelona d7)
      (visited krakow d10)
      (visited krakow d11)
      (visited krakow d12)
      (visited krakow d13)
      (visited rome d8)
      (visited rome d9)
      (visited rome d10)
      (visited rome d11)
      (met_friend)
    )
  )
)