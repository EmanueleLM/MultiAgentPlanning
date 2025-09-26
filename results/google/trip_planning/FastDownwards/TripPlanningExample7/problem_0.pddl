(define (problem travel-11-days-template)
  (:domain travel-days)
  ; TODO: Replace CITY_A CITY_B CITY_C with the three actual city names supplied by agents.
  (:objects
    traveler - agent
    CITY_A CITY_B CITY_C - city
  )

  ; Initial state:
  ; - initial location of traveler: set below (replace CITY_A with actual starting city)
  ; - initial elapsed days: 0
  ; - direct-flight facts: fill in according to the flight connectivity graph provided
  ; - any strict per-city availability constraints (hard constraints) must be encoded here as facts or additional predicates.
  (:init
    ; starting location: replace the placeholder with the actual start city (CITY_A/CITY_B/CITY_C)
    (at traveler CITY_A)

    ; mark the starting city as visited at time 0 (optional; domain 'fly' and 'stay' also set visited)
    (visited CITY_A)

    ; elapsed counter starts at 0
    (= (elapsed) 0)

    ; --- Flight connectivity graph (REPLACE THESE EXAMPLES) ---
    ; Replace or extend the following lines to reflect the actual direct flights provided by the flight_graph.
    ; Each direct-flight fact must be present only if that direct edge exists.
    ; Example placeholder edges (DELETE/REPLACE with real edges):
    ; (direct-flight CITY_A CITY_B)
    ; (direct-flight CITY_B CITY_A)
    ; (direct-flight CITY_B CITY_C)
    ; (direct-flight CITY_C CITY_B)
    ; (direct-flight CITY_A CITY_C)
    ; (direct-flight CITY_C CITY_A)
    ;
    ; If the flight graph is directed, only include the directed edges that exist.
  )

  ; Goal:
  ; - Require that elapsed = 11 (exactly 11 days total).
  ; - Require that all three cities are visited.
  ; If you need additional hard constraints derived from preferences (e.g., minimum stays per city),
  ; provide those and I will encode them as additional goal/initial constraints.
  (:goal
    (and
      (= (elapsed) 11)
      (visited CITY_A)
      (visited CITY_B)
      (visited CITY_C)
    )
  )

  ; Optional: you can add metric/optimization, but here we enforce strict constraints only.
  (:metric minimize (elapsed))
)