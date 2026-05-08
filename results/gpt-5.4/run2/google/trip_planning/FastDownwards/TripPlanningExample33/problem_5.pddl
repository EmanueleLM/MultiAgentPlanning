(define (problem tripplanningexample33_problem)
  (:domain tripplanningexample33_domain)

  (:objects
    barcelona krakow rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
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
      (met_friend)

      (occupied barcelona d1)
      (occupied barcelona d2)
      (occupied barcelona d3)
      (occupied barcelona d4)
      (occupied barcelona d5)
      (occupied barcelona d6)
      (occupied barcelona d7)

      (occupied rome d8)
      (occupied rome d9)
      (occupied rome d10)
      (occupied rome d11)

      (occupied krakow d10)
      (occupied krakow d11)
      (occupied krakow d12)
      (occupied krakow d13)
    )
  )
)