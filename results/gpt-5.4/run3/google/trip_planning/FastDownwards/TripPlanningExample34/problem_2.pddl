(define (problem tripplanningexample34_problem)
  (:domain tripplanningexample34)

  (:objects
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (at valencia)
    (current d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    (final_day d9)

    (direct frankfurt florence)
    (direct florence frankfurt)
    (direct valencia frankfurt)
    (direct frankfurt valencia)
  )

  (:goal
    (and
      (occupied d1 valencia)
      (occupied d2 valencia)

      (occupied d3 florence)
      (occupied d4 florence)
      (occupied d5 florence)
      (occupied d6 florence)

      (occupied d5 frankfurt)
      (occupied d6 frankfurt)
      (occupied d7 frankfurt)
      (occupied d8 frankfurt)
      (occupied d9 frankfurt)
    )
  )
)