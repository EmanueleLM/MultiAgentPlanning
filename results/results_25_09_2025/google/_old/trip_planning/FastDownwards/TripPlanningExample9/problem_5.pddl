(define (problem integrated-trip-problem)
  (:domain integrated-trip)
  (:objects
    frankfurt bucharest stuttgart - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (direct bucharest frankfurt)
    (direct frankfurt bucharest)
    (direct frankfurt stuttgart)
    (direct stuttgart frankfurt)

    (at bucharest d1)
    (assigned d1)

    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)
  )

  (:goal (and
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)

    (at bucharest d1) (at bucharest d2) (at bucharest d3)
    (at frankfurt d4) (at frankfurt d5) (at frankfurt d6)
    (at stuttgart d7)
  ))
)