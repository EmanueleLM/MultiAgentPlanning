(define (problem trip_planning_example20_problem)
  (:domain trip_planning_example20)

  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

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

    (current_day d1)
    (at dubrovnik)
    (in dubrovnik d1)
  )

  (:goal
    (and
      (current_day d12)
      (visited_istanbul_5)
      (visited_budapest_6)
      (visited_dubrovnik_3)
    )
  )
)