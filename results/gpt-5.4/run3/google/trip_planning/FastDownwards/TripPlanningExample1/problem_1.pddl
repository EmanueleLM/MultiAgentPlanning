(define (problem tripplanningexample1)
  (:domain european_trip_15_days)

  (:objects
    riga manchester split - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (current_day d0)

    (next_day d0 d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)

    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)
  )

  (:goal
    (and
      (current_day d15)

      (visited d1 riga)
      (visited d2 riga)
      (visited d3 riga)
      (visited d4 riga)
      (visited d5 riga)
      (visited d6 riga)
      (visited d7 riga)

      (visited d8 manchester)
      (visited d9 manchester)
      (visited d10 manchester)
      (visited d11 manchester)

      (visited d12 split)
      (visited d13 split)
      (visited d14 split)
      (visited d15 split)
    )
  )
)