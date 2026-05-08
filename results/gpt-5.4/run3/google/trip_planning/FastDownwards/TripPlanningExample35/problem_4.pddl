(define (problem trip_planning_example35_problem)
  (:domain trip_planning_example35)

  (:objects
    bucharest zurich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (start)
    (at bucharest d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (connected bucharest zurich)
    (connected zurich bucharest)
    (connected zurich dubrovnik)
    (connected dubrovnik zurich)
  )

  (:goal
    (and
      (at bucharest d1)
      (at bucharest d2)
      (at bucharest d3)
      (at zurich d2)
      (at zurich d3)
      (at dubrovnik d4)
      (at dubrovnik d5)
      (at dubrovnik d6)
      (at dubrovnik d7)
      (at dubrovnik d8)
      (at dubrovnik d9)
      (at dubrovnik d10)
    )
  )
)