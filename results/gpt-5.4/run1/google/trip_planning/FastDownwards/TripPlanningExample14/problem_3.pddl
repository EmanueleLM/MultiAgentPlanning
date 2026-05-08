(define (problem trip_planning_example14_problem)
  (:domain trip_planning_example14)

  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (direct lyon frankfurt)
    (direct frankfurt lyon)
    (direct frankfurt krakow)
    (direct krakow frankfurt)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (current_day d1)
    (at lyon)
  )

  (:goal
    (and
      (occupied d1 lyon)
      (occupied d2 lyon)
      (occupied d3 lyon)
      (occupied d4 lyon)
      (occupied d5 lyon)
      (occupied d6 lyon)
      (occupied d7 lyon)

      (occupied d8 krakow)
      (occupied d9 krakow)
      (occupied d10 krakow)

      (occupied d7 frankfurt)
      (occupied d8 frankfurt)
    )
  )
)