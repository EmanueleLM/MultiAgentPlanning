(define (problem tripplanningexample34_problem)
  (:domain tripplanningexample34)

  (:objects
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (at valencia)
    (current_day d1)

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

    (required d1 valencia)
    (required d2 valencia)
    (required d3 frankfurt)
    (required d4 frankfurt)
    (required d5 frankfurt)
    (required d6 frankfurt)
    (required d7 frankfurt)
    (required d8 florence)
    (required d9 florence)
  )

  (:goal
    (and
      (spent d1 valencia)
      (spent d2 valencia)
      (spent d3 frankfurt)
      (spent d4 frankfurt)
      (spent d5 frankfurt)
      (spent d6 frankfurt)
      (spent d7 frankfurt)
      (spent d8 florence)
      (spent d9 florence)
    )
  )
)