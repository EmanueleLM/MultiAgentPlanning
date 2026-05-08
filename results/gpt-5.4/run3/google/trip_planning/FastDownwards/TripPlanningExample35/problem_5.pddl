(define (problem trip_planning_example35_problem)
  (:domain trip_planning_example35)

  (:objects
    bucharest zurich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (at bucharest)
    (current_day d1)
    (visited bucharest d1)

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
      (visited bucharest d1)
      (visited bucharest d2)
      (visited bucharest d3)

      (visited zurich d4)
      (visited zurich d5)

      (visited dubrovnik d4)
      (visited dubrovnik d5)
      (visited dubrovnik d6)
      (visited dubrovnik d7)
      (visited dubrovnik d8)
      (visited dubrovnik d9)
      (visited dubrovnik d10)
    )
  )
)