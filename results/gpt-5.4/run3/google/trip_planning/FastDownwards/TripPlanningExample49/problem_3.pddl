(define (problem trip_planning_example49_problem)
  (:domain trip_planning_example49)

  (:objects
    reykjavik milan split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
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

    (direct milan reykjavik)
    (direct reykjavik milan)
    (direct milan split)
    (direct split milan)

    (travel_day d3 d4)
    (travel_day d10 d11)

    (at split d1)
    (assigned split d1)
  )

  (:goal
    (and
      (assigned split d1)
      (assigned split d2)
      (assigned split d3)

      (assigned milan d4)
      (assigned milan d5)
      (assigned milan d6)
      (assigned milan d7)
      (assigned milan d8)
      (assigned milan d9)
      (assigned milan d10)

      (assigned reykjavik d11)
      (assigned reykjavik d12)
      (assigned reykjavik d13)
    )
  )
)