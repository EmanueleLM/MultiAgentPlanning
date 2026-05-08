(define (problem tripplanningexample31_problem)
  (:domain tripplanningexample31)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at split)
    (current d1)

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

    (direct frankfurt reykjavik)
    (direct reykjavik frankfurt)
    (direct split frankfurt)
    (direct frankfurt split)

    (workshop_day d8)
    (workshop_day d9)
    (workshop_day d10)
  )

  (:goal
    (and
      (current d11)
      (attended_workshop)

      (visited split d1)
      (visited split d2)
      (visited split d3)
      (visited split d4)
      (visited split d5)
      (visited split d6)
      (visited split d7)

      (visited frankfurt d8)
      (visited frankfurt d9)

      (visited reykjavik d10)
    )
  )
)