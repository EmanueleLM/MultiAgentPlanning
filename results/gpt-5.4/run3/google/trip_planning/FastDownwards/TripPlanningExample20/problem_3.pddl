(define (problem trip_planning_example20_problem)
  (:domain trip_planning_example20)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (current_day d1)

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

    (direct_flight istanbul budapest)
    (direct_flight budapest istanbul)
    (direct_flight dubrovnik istanbul)
  )

  (:goal
    (and
      (visited d1 dubrovnik)
      (visited d2 dubrovnik)
      (visited d3 dubrovnik)
      (visited d4 istanbul)
      (visited d5 istanbul)
      (visited d6 istanbul)
      (visited d7 istanbul)
      (visited d8 istanbul)
      (visited d9 budapest)
      (visited d10 budapest)
      (visited d11 budapest)
      (visited d12 budapest)
      (at budapest)
      (current_day d12)
    )
  )
)