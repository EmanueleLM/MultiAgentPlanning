(define (problem transport_problem)
  (:domain transport_domain)

  ;; Explicit assumptions encoded as objects and predicates:
  ;; - Airports are objects of type 'airport' (a subtype of location).
  ;; - same_city and different_city are provided extensionally in :init to enforce city constraints.
  ;; - No numeric capacities or temporal durations are modeled; actions are atomic and STRIPS-style.
  ;; - All initial facts from the human specification are included exactly.

  (:objects
    ;; trucks
    truck_0 truck_1 - truck
    ;; airplane
    airplane_0 - airplane
    ;; package
    package_0 - package
    ;; cities
    city_0 city_1 - city
    ;; airports (typed as airport, a subtype of location)
    location_0_0 location_1_0 - airport
    ;; other locations
    location_0_1 location_0_2 location_1_1 location_1_2 - location
  )

  (:init
    ;; Vehicle and package initial locations (from specification)
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_2)
    (airplane_at airplane_0 location_0_0)
    (package_at package_0 location_1_0)

    ;; City membership encoded via same_city relation (symmetric entries)
    ;; city_0: location_0_0, location_0_1, location_0_2
    (same_city location_0_0 location_0_1)
    (same_city location_0_1 location_0_0)
    (same_city location_0_0 location_0_2)
    (same_city location_0_2 location_0_0)
    (same_city location_0_1 location_0_2)
    (same_city location_0_2 location_0_1)

    ;; city_1: location_1_0, location_1_1, location_1_2
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)
    (same_city location_1_0 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_1)

    ;; different_city entries for airport-to-airport flights (symmetric)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)
  )

  (:goal
    (and
      (package_at package_0 location_1_1)
    )
  )
)