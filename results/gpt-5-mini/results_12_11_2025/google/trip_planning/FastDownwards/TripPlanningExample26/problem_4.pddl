(define (problem trip-planning-problem)
  (:domain trip-planning-domain)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    legA legB - leg
  )

  (:init
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4)
    (unassigned d5) (unassigned d6) (unassigned d7) (unassigned d8)
    (unassigned d9) (unassigned d10) (unassigned d11) (unassigned d12)
    (unassigned d13) (unassigned d14) (unassigned d15) (unassigned d16)

    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)

    (direct-flight porto berlin)
    (direct-flight berlin reykjavik)

    (flight-leg legA porto berlin)
    (flight-leg legB berlin reykjavik)
  )

  (:goal (and
    (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
    (city-on-day porto d4) (city-on-day porto d5)

    (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
    (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)

    (city-on-day reykjavik d12) (city-on-day reykjavik d13)
    (city-on-day reykjavik d14) (city-on-day reykjavik d15)
    (city-on-day reykjavik d16)

    (flight-used legA)
    (flight-used legB)

    (not (unassigned d1)) (not (unassigned d2)) (not (unassigned d3))
    (not (unassigned d4)) (not (unassigned d5)) (not (unassigned d6))
    (not (unassigned d7)) (not (unassigned d8)) (not (unassigned d9))
    (not (unassigned d10)) (not (unassigned d11)) (not (unassigned d12))
    (not (unassigned d13)) (not (unassigned d14)) (not (unassigned d15))
    (not (unassigned d16))
  ))