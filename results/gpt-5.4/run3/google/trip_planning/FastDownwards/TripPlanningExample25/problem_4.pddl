(define (problem tripplanningexample25_problem)
  (:domain tripplanningexample25)

  (:objects
    valencia lyon split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (direct lyon split)
    (direct split lyon)
    (direct valencia lyon)
    (direct lyon valencia)

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
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    (current_day d1)
  )

  (:goal
    (and
      (visited d10 split)
      (visited d11 split)
      (visited d12 split)
      (visited d13 split)
      (visited d14 split)
      (visited d15 split)
      (visited d16 split)

      (visited d1 valencia)
      (visited d2 valencia)
      (visited d3 valencia)
      (visited d4 valencia)
      (visited d5 valencia)

      (visited d6 lyon)
      (visited d7 lyon)
      (visited d8 lyon)
      (visited d9 lyon)

      (current_day d16)
    )
  )
)