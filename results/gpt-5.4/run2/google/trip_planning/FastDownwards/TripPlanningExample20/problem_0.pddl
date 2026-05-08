(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
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

    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    (current_day d1)
    (at istanbul)
    (occupied d1 istanbul)
  )

  (:goal
    (and
      (current_day d12)

      (occupied d1 istanbul)
      (occupied d2 istanbul)
      (occupied d3 istanbul)
      (occupied d4 istanbul)
      (occupied d5 istanbul)

      (occupied d6 budapest)
      (occupied d7 budapest)
      (occupied d8 budapest)
      (occupied d9 budapest)
      (occupied d10 budapest)
      (occupied d11 budapest)

      (occupied d10 dubrovnik)
      (occupied d11 dubrovnik)
      (occupied d12 dubrovnik)
    )
  )
)