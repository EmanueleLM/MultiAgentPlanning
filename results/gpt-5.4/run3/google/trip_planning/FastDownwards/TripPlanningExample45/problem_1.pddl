(define (problem tripplanningexample45)
  (:domain european_trip_days)

  (:objects
    copenhagen lisbon florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
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

    (direct copenhagen lisbon)
    (direct lisbon copenhagen)
    (direct lisbon florence)
    (direct florence lisbon)

    (current_day d1)
    (at copenhagen)
    (visited_day d1 copenhagen)
  )

  (:goal
    (and
      (current_day d16)

      (visited_day d1 copenhagen)
      (visited_day d7 copenhagen)

      (visited_day d2 copenhagen)
      (visited_day d3 copenhagen)
      (visited_day d4 copenhagen)
      (visited_day d5 lisbon)
      (visited_day d6 lisbon)
      (visited_day d8 lisbon)
      (visited_day d9 lisbon)
      (visited_day d10 lisbon)

      (visited_day d11 florence)
      (visited_day d12 florence)
      (visited_day d13 florence)
      (visited_day d14 florence)

      (visited_day d15 lisbon)
      (visited_day d16 lisbon)
    )
  )
)