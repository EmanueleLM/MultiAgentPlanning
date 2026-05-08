(define (problem tripplanningexample31_problem)
  (:domain tripplanningexample31)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at split)
    (current_day d1)

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

    (workshop_day d8)
    (workshop_day d9)
    (workshop_day d10)
  )

  (:goal
    (and
      (current_day d11)
      (workshop_attended)

      (spent split d1)
      (spent split d2)
      (spent split d3)
      (spent split d4)
      (spent split d5)
      (spent split d6)
      (spent split d7)

      (spent frankfurt d8)
      (spent frankfurt d9)

      (spent reykjavik d10)
    )
  )
)