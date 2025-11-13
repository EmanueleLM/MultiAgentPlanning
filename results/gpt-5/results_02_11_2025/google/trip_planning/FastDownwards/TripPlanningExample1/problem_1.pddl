(define (problem tripplanningexample1-problem)
  (:domain tripplanningexample1)
  (:objects
    riga manchester split - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    (at riga)
    (day d0)

    (allowed riga manchester)
    (allowed manchester riga)
    (allowed manchester split)

    (next d0 d1)
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

    ; Riga for 6 days: d0..d5
    (needs_city riga d0)
    (needs_city riga d1)
    (needs_city riga d2)
    (needs_city riga d3)
    (needs_city riga d4)
    (needs_city riga d5)

    ; Manchester for 4 days: d6..d9
    (needs_city manchester d6)
    (needs_city manchester d7)
    (needs_city manchester d8)
    (needs_city manchester d9)

    ; Split for 5 days: d10..d14
    (needs_city split d10)
    (needs_city split d11)
    (needs_city split d12)
    (needs_city split d13)
    (needs_city split d14)
  )
  (:goal
    (and
      (day d15)
    )
  )
)