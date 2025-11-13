(define (problem trip-planning-problem)
  (:domain trip-planning-domain)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (direct_flight porto berlin)
    (direct_flight berlin reykjavik)

    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)
  )

  (:goal (and
    (city_on_day porto d1) (city_on_day porto d2) (city_on_day porto d3)
    (city_on_day porto d4) (city_on_day porto d5)

    (city_on_day berlin d6) (city_on_day berlin d7) (city_on_day berlin d8)
    (city_on_day berlin d9) (city_on_day berlin d10) (city_on_day berlin d11)

    (city_on_day reykjavik d12) (city_on_day reykjavik d13)
    (city_on_day reykjavik d14) (city_on_day reykjavik d15)
    (city_on_day reykjavik d16)
  ))
)