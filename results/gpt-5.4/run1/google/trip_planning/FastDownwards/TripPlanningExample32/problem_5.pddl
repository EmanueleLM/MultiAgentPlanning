(define (problem tripplanningexample32_problem)
  (:domain tripplanningexample32)

  (:objects
    paris reykjavik riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (today d1)
    (final_day d10)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (direct paris reykjavik)
    (direct reykjavik paris)
    (direct riga paris)
    (direct paris riga)
  )

  (:goal
    (and
      (today d10)

      (occupied reykjavik d6)
      (occupied reykjavik d7)
      (occupied reykjavik d8)
      (occupied reykjavik d9)
      (occupied reykjavik d10)

      (occupied riga d1)
      (occupied riga d2)
      (occupied riga d3)

      (occupied paris d4)
      (occupied paris d5)
      (occupied paris d6)
      (occupied paris d7)
    )
  )
)