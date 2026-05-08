(define (problem tripplanningexample31_problem)
  (:domain tripplanningexample31)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at split)
    (today d1)

    (direct frankfurt reykjavik)
    (direct reykjavik frankfurt)
    (direct split frankfurt)
    (direct frankfurt split)

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

    (workshop_window d8)
    (workshop_window d9)
    (workshop_window d10)
  )

  (:goal
    (and
      (today d11)
      (workshop_attended)

      (occupied frankfurt d3)
      (occupied frankfurt d4)

      (occupied reykjavik d8)
      (occupied reykjavik d9)
      (occupied reykjavik d10)

      (occupied split d1)
      (occupied split d2)
      (occupied split d5)
      (occupied split d6)
      (occupied split d7)
    )
  )
)