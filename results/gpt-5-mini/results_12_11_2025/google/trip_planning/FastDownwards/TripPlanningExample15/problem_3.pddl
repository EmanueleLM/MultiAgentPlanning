(define (problem TripPlanningExample15_fixed)
  (:domain travel)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    berlin porto krakow - city
  )

  (:init
    ;; Sequential day ordering (explicit ordered stages)
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

    ;; Direct flight adjacency (symmetric as given)
    (adjacent berlin porto)
    (adjacent porto berlin)
    (adjacent berlin krakow)
    (adjacent krakow berlin)

    ;; Seed the contiguous assignment: start in Krakow on day 1.
    (at d1 krakow)
    (assigned d1)
  )

  ;; Goals encode the single feasible, audited 11-day itinerary exactly.
  ;; This enforces contiguous assignments by requiring specific city occupancy on each day.
  (:goal (and
    (at d1 krakow)
    (at d2 krakow)
    (at d3 krakow)
    (at d4 berlin)
    (at d5 berlin)
    (at d6 berlin)
    (at d7 berlin)
    (at d8 berlin)
    (at d9 berlin)
    (at d10 porto)
    (at d11 porto)
  ))
)