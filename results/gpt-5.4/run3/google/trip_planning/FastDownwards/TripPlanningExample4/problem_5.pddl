(define (problem tripplanningexample4)
  (:domain european_trip_12_days)

  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
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

    (flight seville munich)
    (flight munich seville)
    (flight munich tallinn)
    (flight tallinn munich)

    (friend_window d11)
    (friend_window d12)
  )

  (:goal
    (and
      (occupied seville d1)
      (occupied seville d2)
      (occupied seville d3)
      (occupied seville d4)
      (occupied seville d5)
      (occupied seville d6)
      (occupied seville d7)

      (occupied munich d8)
      (occupied munich d9)
      (occupied munich d10)
      (occupied munich d11)
      (occupied munich d12)

      (occupied tallinn d11)
      (occupied tallinn d12)

      (friend_met)
      (current d12)
    )
  )
)