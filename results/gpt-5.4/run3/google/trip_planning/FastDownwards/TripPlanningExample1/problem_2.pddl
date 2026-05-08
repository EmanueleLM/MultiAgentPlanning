(define (problem tripplanningexample1)
  (:domain european_trip_15_days)

  (:objects
    riga manchester split - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (current_day d0)
    (at riga)

    (day_in d0 riga)

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

      (day_in d0 riga)
      (day_in d1 riga)
      (day_in d2 riga)
      (day_in d3 riga)
      (day_in d4 riga)
      (day_in d5 riga)
      (day_in d6 riga)

      (day_in d7 manchester)
      (day_in d8 manchester)
      (day_in d9 manchester)
      (day_in d10 manchester)

      (day_in d11 split)
      (day_in d12 split)
      (day_in d13 split)
      (day_in d14 split)
      (day_in d15 split)
    )
  )
)