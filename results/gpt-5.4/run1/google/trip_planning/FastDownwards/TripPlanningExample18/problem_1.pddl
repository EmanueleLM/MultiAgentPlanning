(define (problem tripplanningexample18)
  (:domain european_trip_11_days)

  (:objects
    amsterdam vilnius bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

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

    (current d1)
  )

  (:goal
    (and
      (current d11)
      (visited amsterdam)
      (visited vilnius)
      (visited bucharest)
      (met_friends)

      (at bucharest d6)

      (at amsterdam d1)
      (at amsterdam d2)
      (at amsterdam d3)
      (at amsterdam d4)
      (at amsterdam d5)

      (at vilnius d10)
      (at vilnius d11)

      (at bucharest d6)
      (at bucharest d7)
      (at bucharest d8)
      (at bucharest d9)
      (at bucharest d10)
    )
  )
)