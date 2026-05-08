(define (problem european_trip_days_instance)
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

    (assigned d1)
    (current_day d1)
    (at d1 copenhagen)
  )

  (:goal
    (and
      (current_day d16)
      (assigned d16)

      (at d1 copenhagen)
      (at d7 copenhagen)

      (at d1 copenhagen)
      (at d2 copenhagen)
      (at d3 copenhagen)
      (at d4 copenhagen)
      (at d5 copenhagen)
      (at d6 copenhagen)
      (at d7 copenhagen)

      (at d8 lisbon)
      (at d9 lisbon)
      (at d10 lisbon)
      (at d11 lisbon)
      (at d12 lisbon)
      (at d13 lisbon)
      (at d14 lisbon)

      (at d13 florence)
      (at d14 florence)
      (at d15 florence)
      (at d16 florence)
    )
  )
)