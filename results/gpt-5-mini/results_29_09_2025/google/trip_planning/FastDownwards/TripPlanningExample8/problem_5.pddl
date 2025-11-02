(define (problem trip-16-days)
  (:domain itinerary)
  (:objects
    athens krakow zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    k1 k2 k3 k4 k5 k6 - krtoken
    z1 z2 z3 z4 z5 - zutoken
  )

  (:init
    (flight zurich krakow)
    (flight krakow zurich)
    (flight athens zurich)
    (flight zurich athens)

    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12)
    (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)

    (at athens d1) (at athens d2) (at athens d3) (at athens d4) (at athens d5) (at athens d6) (at athens d7)

    (unassigned d8) (unassigned d9) (unassigned d10) (unassigned d11) (unassigned d12) (unassigned d13) (unassigned d14) (unassigned d15) (unassigned d16)

    (kr-token-available k1) (kr-token-available k2) (kr-token-available k3) (kr-token-available k4) (kr-token-available k5) (kr-token-available k6)
    (zu-token-available z1) (zu-token-available z2) (zu-token-available z3) (zu-token-available z4) (zu-token-available z5)
  )

  (:goal
    (and
      (kr-token-used k1) (kr-token-used k2) (kr-token-used k3) (kr-token-used k4) (kr-token-used k5) (kr-token-used k6)
      (zu-token-used z1) (zu-token-used z2) (zu-token-used z3) (zu-token-used z4) (zu-token-used z5)
      (at athens d1) (at athens d2) (at athens d3) (at athens d4) (at athens d5) (at athens d6) (at athens d7)
    )
  )
)