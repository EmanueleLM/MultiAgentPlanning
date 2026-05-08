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

    (day_successor d1 d2)
    (day_successor d2 d3)
    (day_successor d3 d4)
    (day_successor d4 d5)
    (day_successor d5 d6)
    (day_successor d6 d7)
    (day_successor d7 d8)
    (day_successor d8 d9)
    (day_successor d9 d10)
    (day_successor d10 d11)
    (day_successor d11 d12)

    (last_day d12)
    (next_day d1)
  )

  (:goal
    (and
      (trip_finished)

      (spent_day_in d1 istanbul)
      (spent_day_in d2 istanbul)
      (spent_day_in d3 istanbul)
      (spent_day_in d4 istanbul)
      (spent_day_in d5 istanbul)

      (spent_day_in d6 budapest)
      (spent_day_in d7 budapest)
      (spent_day_in d8 budapest)
      (spent_day_in d9 budapest)
      (spent_day_in d10 budapest)
      (spent_day_in d11 budapest)

      (spent_day_in d10 dubrovnik)
      (spent_day_in d11 dubrovnik)
      (spent_day_in d12 dubrovnik)
    )
  )
)