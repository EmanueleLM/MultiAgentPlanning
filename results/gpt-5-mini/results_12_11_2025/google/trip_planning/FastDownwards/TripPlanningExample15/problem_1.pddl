(define (problem TripPlanningExample15_verify)
  (:domain travel)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    Berlin Porto Krakow - city
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

    ;; Direct flight adjacency (symmetric)
    (adjacent Berlin Porto)
    (adjacent Porto Berlin)
    (adjacent Berlin Krakow)
    (adjacent Krakow Berlin)

    ;; Starting assignment: day 1 in Krakow
    (at d1 Krakow)
    (assigned d1)
  )

  ;; Goals enforce the audited/selected feasible itinerary constraints:
  ;; - Being in Porto on days 10 and 11 (wedding requirement)
  ;; - Berlin occupies exactly six specified days (days 4..9)
  ;; - Krakow occupies the remaining three days (days 1..3)
  ;; These goal facts force the planner to realize the feasible itinerary consistent with direct-flight constraints.
  (:goal (and
    (at d1 Krakow)
    (at d2 Krakow)
    (at d3 Krakow)
    (at d4 Berlin)
    (at d5 Berlin)
    (at d6 Berlin)
    (at d7 Berlin)
    (at d8 Berlin)
    (at d9 Berlin)
    (at d10 Porto)
    (at d11 Porto)
  ))
)