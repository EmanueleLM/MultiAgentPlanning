(define (problem tripplanningexample0-problem)
  (:domain tripplanningexample0-domain)
  (:objects
    barcelona florence helsinki - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )
  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13) (next d13 d14)

    (direct barcelona florence)
    (direct florence barcelona)
    (direct helsinki barcelona)
    (direct barcelona helsinki)

    (window d9) (window d10) (window d11) (window d12) (window d13) (window d14)

    (meeting-city florence)

    (at helsinki d1)
    (reached d1)
  )
  (:goal
    (and
      (reached d14)
      (met)
      (visited helsinki)
      (visited barcelona)
      (visited florence)
    )
  )
)