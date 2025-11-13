(define (problem trip-planning-problem)
  (:domain trip-planning-domain)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; direct flight graph (only allowed legs)
    (direct-flight porto berlin)
    (direct-flight berlin reykjavik)

    ;; day successor relation (explicit discrete time ordering)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)
  )

  ;; Goal enforces the audited itinerary: Porto d1..d5, Berlin d6..d11, Reykjavik d12..d16.
  ;; This also ensures Reykjavik covers days 12..16 so the meeting window (day 12..16) is satisfied.
  (:goal (and
    (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
    (city-on-day porto d4) (city-on-day porto d5)

    (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
    (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)

    (city-on-day reykjavik d12) (city-on-day reykjavik d13)
    (city-on-day reykjavik d14) (city-on-day reykjavik d15)
    (city-on-day reykjavik d16)
  ))
)