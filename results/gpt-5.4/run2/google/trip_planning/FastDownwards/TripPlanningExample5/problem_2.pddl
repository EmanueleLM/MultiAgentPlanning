(define (problem trip_planning_example5_instance)
  (:domain trip_planning_example5)

  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)

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

    (current_day d1)
  )

  (:goal
    (and
      (at oslo d1)
      (at oslo d2)
      (at oslo d3)
      (at oslo d4)
      (at oslo d5)
      (at oslo d6)

      (at porto d7)
      (at porto d8)
      (at porto d9)
      (at porto d10)
      (at porto d11)
      (at porto d13)
      (at porto d14)

      (at dubrovnik d12)
      (at dubrovnik d15)
      (at dubrovnik d16)

      (visited_day d16)
      (current_day d16)
    )
  )
)