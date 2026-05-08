(define (problem tripplanningexample42_problem)
  (:domain tripplanningexample42)

  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (at paris)
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
    (next d11 d12)

    (direct paris nice)
    (direct nice paris)
    (direct nice mykonos)
    (direct mykonos nice)

    (friends_window d1)
    (friends_window d2)
    (friends_window d3)
    (friends_window d4)
  )

  (:goal
    (and
      (current d12)
      (met_friends)

      (in_city_on paris d1)
      (in_city_on paris d2)
      (in_city_on paris d3)
      (in_city_on paris d4)

      (in_city_on mykonos d5)
      (in_city_on mykonos d6)
      (in_city_on mykonos d7)
      (in_city_on mykonos d8)

      (in_city_on nice d9)
      (in_city_on nice d10)
      (in_city_on nice d11)
    )
  )
)