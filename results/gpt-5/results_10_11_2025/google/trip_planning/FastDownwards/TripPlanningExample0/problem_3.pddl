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

    (seg1-city helsinki)
    (seg2-city barcelona)
    (seg3-city florence)

    (seg1-step d1 d2) (seg1-step d2 d3)
    (seg1-to-seg2 d3 d4)

    (seg2-step d4 d5) (seg2-step d5 d6) (seg2-step d6 d7) (seg2-step d7 d8)
    (seg2-to-seg3 d8 d9)

    (seg3-step d9 d10) (seg3-step d10 d11) (seg3-step d11 d12) (seg3-step d12 d13) (seg3-step d13 d14)

    (window d9) (window d10) (window d11) (window d12) (window d13) (window d14)

    (meeting-city florence)

    (at helsinki d1)
    (reached d1)
  )
  (:goal
    (and
      (reached d14)
      (met)
    )
  )
)