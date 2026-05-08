(define (problem transport_problem)
  (:domain transport_domain)

  ; Assumptions and notes (explicit, as requested):
  ; - Trucks and airplanes have unlimited capacity (no numeric capacity modeled).
  ; - Packages are represented exclusively by package_at OR in_truck OR in_airplane.
  ;   The initial state respects this exclusivity invariant and all actions preserve it.
  ; - same_city and different_city binary relations are fully specified below for the
  ;   relevant location pairs. These predicates enforce city membership checks so
  ;   actions cannot cross city boundaries except via airplane_fly which requires different_city.
  ; - Airports are typed as 'airport' (a subtype of location). Airplane actions require airport-typed locations.
  ; - Trucks cannot drive between locations in different cities (enforced by same_city in preconditions).
  ; - The planner must achieve the hard goal: package_0 at location_1_1 (package_at package_0 location_1_1).
  ; - No temporal or cost modeling is included; actions are atomic and STRIPS-style.

  (:objects
    truck_1 - truck
    airplane_0 - airplane
    package_0 - package

    ;; Airports (subtype 'airport' of location)
    location_0_0 location_1_0 - airport

    ;; Other locations (non-airport)
    location_1_1 location_1_2 - location
  )

  (:init
    ;; Initial agent/vehicle/package locations (given facts)
    (truck_at truck_1 location_1_2)
    (airplane_at airplane_0 location_0_0)
    (package_at package_0 location_1_0)

    ;; Location/city relations (precomputed)
    ;; city_1: location_1_0 (airport), location_1_1, location_1_2 are in the same city
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)
    (same_city location_1_0 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_1)

    ;; Different-city relations between the two airports (city_0 vs city_1)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)
  )

  (:goal
    (and
      (package_at package_0 location_1_1)
    )
  )
)