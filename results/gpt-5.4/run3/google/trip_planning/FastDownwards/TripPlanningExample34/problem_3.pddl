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
  )

  (:goal
    (and
      (visited_on d1 valencia)
      (visited_on d2 valencia)

      (visited_on d3 florence)
      (visited_on d4 florence)
      (visited_on d5 florence)
      (visited_on d6 florence)

      (visited_on d5 frankfurt)
      (visited_on d6 frankfurt)
      (visited_on d7 frankfurt)
      (visited_on d8 frankfurt)
      (visited_on d9 frankfurt)
    )
  )
)