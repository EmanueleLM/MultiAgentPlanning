(define (problem TripPlanningExample14)
  (:domain trip-planning-10days)
  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    ; start in Lyon on day 1
    (at lyon)
    (current d1)

    ; direct flight graph (bidirectional)
    (edge lyon frankfurt)
    (edge frankfurt lyon)
    (edge frankfurt krakow)
    (edge krakow frankfurt)

    ; day successors (self-loop on d10 allows assigning day 10)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d10)
  )

  ; Soft preference notes (not enforced as hard constraints):
  ; - Prefer 7 days in Lyon: infeasible due to required F->K transfer before day 8; nearest-feasible is 6 days in Lyon.
  ; - Prefer 2 days in Frankfurt: sacrificed to maximize Lyon days per priority order (1 day in Frankfurt).
  ; - 3 days in Krakow on show days (8–10): enforced below.

  (:goal
    (and
      ; allocate each of the 10 days exactly once
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)
      (assigned d10)

      ; exact target itinerary (unique up to action choices):
      (on d1 lyon)
      (on d2 lyon)
      (on d3 lyon)
      (on d4 lyon)
      (on d5 lyon)
      (on d6 lyon)
      (on d7 frankfurt)
      (on d8 krakow)
      (on d9 krakow)
      (on d10 krakow)

      ; must visit all three cities (at least one full day in each)
      (visited lyon)
      (visited frankfurt)
      (visited krakow)
    )
  )
)