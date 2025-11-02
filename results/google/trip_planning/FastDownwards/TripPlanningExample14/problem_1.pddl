(define (problem trip-itinerary-10)
  (:domain trip-itinerary)
  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (city lyon) (city frankfurt) (city krakow)
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6) (day d7) (day d8) (day d9) (day d10)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (first d1)

    ; Direct flight graph (both directions where available)
    (edge lyon frankfurt)
    (edge frankfurt lyon)
    (edge frankfurt krakow)
    (edge krakow frankfurt)
  )
  (:goal (and
    ; Hard requirements encoded as fixed day-city assignments
    (at d1 lyon)
    (at d2 lyon)
    (at d3 lyon)
    (at d4 lyon)
    (at d5 lyon)
    (at d6 lyon)
    (at d7 lyon)
    (at d8 krakow)
    (at d9 krakow)
    (at d10 krakow)
  ))
)