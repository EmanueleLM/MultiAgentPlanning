(define (problem tripplanningexample15_problem)
  (:domain tripplanningexample15)

  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at berlin)
    (current_day d1)
    (in_city_on berlin d1)

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
      (current_day d11)

      (in_city_on berlin d1)
      (in_city_on berlin d2)
      (in_city_on berlin d3)
      (in_city_on berlin d4)
      (in_city_on berlin d5)
      (in_city_on berlin d6)

      (in_city_on krakow d7)
      (in_city_on krakow d8)
      (in_city_on krakow d9)
      (in_city_on krakow d10)
      (in_city_on krakow d11)

      (in_city_on porto d10)
      (in_city_on porto d11)
    )
  )
)