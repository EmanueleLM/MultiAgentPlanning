(define (problem transport-problem-instance)
  (:domain transport-domain)

  (:objects
    ;; locations
    location_0_0 location_0_1 location_0_2 - location
    location_1_0 location_1_1 location_1_2 - location

    ;; cities
    city_0 city_1 - city

    ;; trucks and airplane
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 - package
  )

  (:init
    ;; explicit type identity predicates (redundant with typing but included per spec)
    (location location_0_0) (location location_0_1) (location location_0_2)
    (location location_1_0) (location location_1_1) (location location_1_2)

    (city city_0) (city city_1)

    (truck truck_0) (truck truck_1)
    (airplane airplane_0)
    (package package_0)

    ;; in-city mappings (static)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; truck-of-city static mapping (exactly one truck per city)
    (truck-of-city truck_0 city_0)
    (truck-of-city truck_1 city_1)

    ;; initial positions
    (at-airplane airplane_0 location_1_0)   ;; airplane starts in city_1 airport
    (at package_0 location_0_1)             ;; package in city_0 at location_0_1
    (at-truck truck_0 location_0_2)
    (at-truck truck_1 location_1_0)

    ;; same-city relation: precomputed for all location pairs within same city (symmetric)
    ;; city_0 pairs
    (same-city location_0_0 location_0_0)
    (same-city location_0_0 location_0_1)
    (same-city location_0_0 location_0_2)
    (same-city location_0_1 location_0_0)
    (same-city location_0_1 location_0_1)
    (same-city location_0_1 location_0_2)
    (same-city location_0_2 location_0_0)
    (same-city location_0_2 location_0_1)
    (same-city location_0_2 location_0_2)

    ;; city_1 pairs
    (same-city location_1_0 location_1_0)
    (same-city location_1_0 location_1_1)
    (same-city location_1_0 location_1_2)
    (same-city location_1_1 location_1_0)
    (same-city location_1_1 location_1_1)
    (same-city location_1_1 location_1_2)
    (same-city location_1_2 location_1_0)
    (same-city location_1_2 location_1_1)
    (same-city location_1_2 location_1_2)

    ;; Ensure package not in any vehicle initially
    ;; (in_any package_0) absent -> default false
  )

  (:goal (and
    (at package_0 location_1_2)
  ))

)