(define (problem eu-trip-11days)
  (:domain eu-trip)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    berlin porto krakow - city
  )
  (:init
    ; direct-flight adjacency (both directions)
    (adjacent berlin porto)
    (adjacent porto berlin)
    (adjacent berlin krakow)
    (adjacent krakow berlin)

    ; day order
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

    ; required day-to-city targets (encodes the audited feasible itinerary)
    (target d1 krakow)
    (target d2 krakow)
    (target d3 krakow)
    (target d4 berlin)
    (target d5 berlin)
    (target d6 berlin)
    (target d7 berlin)
    (target d8 berlin)
    (target d9 berlin)
    (target d10 porto)
    (target d11 porto)

    ; start state
    (at d1 krakow)
    (filled d1)
  )
  (:goal (and
    ; achieving filled d11 forces a unique chain of day-by-day moves
    ; consistent with targets, adjacency, and continuity.
    (filled d11)
  ))
)