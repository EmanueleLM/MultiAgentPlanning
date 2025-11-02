(define (problem tripplanningexample8-problem)
  (:domain tripplanningexample8)

  (:objects
    athens zurich krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (current-day d1)
    (at athens d1)

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
    (next d14 d15)
    (next d15 d16)

    (direct athens zurich)
    (direct zurich athens)
    (direct zurich krakow)
    (direct krakow zurich)

    ; Schedule: Athens days 1-7
    (scheduled athens d1)
    (scheduled athens d2)
    (scheduled athens d3)
    (scheduled athens d4)
    (scheduled athens d5)
    (scheduled athens d6)
    (scheduled athens d7)

    ; Schedule: Zurich days 8-11
    (scheduled zurich d8)
    (scheduled zurich d9)
    (scheduled zurich d10)
    (scheduled zurich d11)

    ; Schedule: Krakow days 12-16
    (scheduled krakow d12)
    (scheduled krakow d13)
    (scheduled krakow d14)
    (scheduled krakow d15)
    (scheduled krakow d16)
  )

  (:goal (and
    (current-day d16)
    (visited athens)
    (visited zurich)
    (visited krakow)
  ))
)