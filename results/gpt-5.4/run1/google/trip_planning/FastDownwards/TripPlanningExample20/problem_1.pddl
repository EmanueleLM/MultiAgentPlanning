(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (direct_flight istanbul budapest)
    (direct_flight budapest istanbul)
    (direct_flight dubrovnik istanbul)

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

    (last_day d12)
    (current_day d1)

    (at dubrovnik)
  )

  (:goal
    (and
      (visited_on d1 dubrovnik)
      (visited_on d2 dubrovnik)
      (visited_on d3 dubrovnik)

      (visited_on d4 istanbul)
      (visited_on d5 istanbul)
      (visited_on d6 istanbul)
      (visited_on d7 istanbul)
      (visited_on d8 istanbul)

      (visited_on d9 budapest)
      (visited_on d10 budapest)
      (visited_on d11 budapest)
      (visited_on d12 budapest)
    )
  )
)