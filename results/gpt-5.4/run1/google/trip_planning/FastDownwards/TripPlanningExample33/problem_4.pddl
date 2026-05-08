(define (problem tripplanningexample33_problem)
  (:domain tripplanningexample33)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )

  (:init
    (at rome)
    (current d1)

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

    (stay_target d1 rome)
    (stay_target d2 rome)
    (stay_target d3 rome)
    (stay_target d4 rome)

    (stay_target d5 barcelona)
    (stay_target d6 barcelona)
    (stay_target d7 barcelona)
    (stay_target d8 barcelona)
    (stay_target d9 barcelona)
    (stay_target d10 barcelona)
    (stay_target d11 barcelona)

    (stay_target d12 krakow)
    (stay_target d13 krakow)

    (friend_day d10)
    (friend_day d11)
    (friend_day d12)
    (friend_day d13)
  )

  (:goal
    (and
      (current d14)
      (at krakow)
      (met_friend)
    )
  )
)