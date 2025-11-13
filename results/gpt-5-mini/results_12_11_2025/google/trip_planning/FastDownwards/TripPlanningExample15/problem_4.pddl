(define (problem TripPlanningExample15_final)
  (:domain travel)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    berlin porto krakow - city
  )

  (:init
    ;; Sequential day ordering
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

    ;; Direct flight adjacency (bidirectional as given)
    (adjacent berlin porto)
    (adjacent porto berlin)
    (adjacent berlin krakow)
    (adjacent krakow berlin)

    ;; Seed the plan: start in Krakow on day 1 (assigned to prevent reassignment).
    (at d1 krakow)
    (assigned d1)
  )

  ;; Goal: exact, audited itinerary (one city per day).
  ;; This encodes the contiguous, terminal, and mandatory constraints exactly.
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