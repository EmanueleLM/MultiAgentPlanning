(define (problem tripplanningexample18)
  (:domain tripplanningexample18)

  (:objects
    amsterdam vilnius bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (current_day d1)

    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct amsterdam vilnius)
    (direct vilnius amsterdam)

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
  )

  (:goal
    (and
      (current_day d11)

      (occupied d1)
      (occupied d2)
      (occupied d3)
      (occupied d4)
      (occupied d5)
      (occupied d6)
      (occupied d7)
      (occupied d8)
      (occupied d9)
      (occupied d10)
      (occupied d11)

      (at vilnius d1)
      (at vilnius d2)

      (at amsterdam d3)
      (at amsterdam d4)
      (at amsterdam d5)
      (at amsterdam d6)
      (at amsterdam d7)

      (at bucharest d6)
      (at bucharest d7)
      (at bucharest d8)
      (at bucharest d9)
      (at bucharest d10)
      (at bucharest d11)

      (friends_met)
    )
  )
)