(define (problem tripplanningexample15_problem)
  (:domain tripplanningexample15)

  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at berlin)
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

    (direct berlin porto)
    (direct porto berlin)
    (direct berlin krakow)
    (direct krakow berlin)
  )

  (:goal
    (and
      (current d11)

      (occupies berlin d1)
      (occupies berlin d2)
      (occupies berlin d3)
      (occupies berlin d4)
      (occupies berlin d5)
      (occupies berlin d6)

      (occupies krakow d7)
      (occupies krakow d8)
      (occupies krakow d9)

      (occupies porto d10)
      (occupies porto d11)
    )
  )
)