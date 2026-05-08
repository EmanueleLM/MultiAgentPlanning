(define (problem european_trip_16days_instance)
  (:domain european_trip_16days)

  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (current_day d1)

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
    (next_day d15 d16)

    (direct_flight oslo dubrovnik)
    (direct_flight dubrovnik oslo)
    (direct_flight porto oslo)
    (direct_flight oslo porto)
  )

  (:goal
    (and
      (current_day d16)
      (assigned d16)

      (at porto d1)
      (at porto d2)
      (at porto d3)
      (at porto d4)
      (at porto d5)
      (at porto d6)
      (at porto d7)

      (at oslo d8)
      (at oslo d9)
      (at oslo d10)
      (at oslo d11)
      (at oslo d13)
      (at oslo d14)

      (at dubrovnik d12)
      (at dubrovnik d15)
      (at dubrovnik d16)
    )
  )
)