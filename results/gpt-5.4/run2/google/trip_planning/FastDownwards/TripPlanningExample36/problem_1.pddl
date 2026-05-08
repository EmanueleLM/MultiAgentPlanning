(define (problem tripplanningexample36)
  (:domain european_trip_13_days)

  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (direct florence munich)
    (direct florence warsaw)

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

    (current_day d1)

    (at florence)
    (visited florence d1)
  )

  (:goal
    (and
      (visited florence d1)
      (visited florence d2)

      (visited warsaw d3)
      (visited warsaw d4)
      (visited warsaw d5)
      (visited warsaw d6)
      (visited warsaw d7)
      (visited warsaw d8)
      (visited warsaw d9)

      (visited munich d10)
      (visited munich d11)
      (visited munich d12)
      (visited munich d13)
    )
  )
)