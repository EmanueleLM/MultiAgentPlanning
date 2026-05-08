(define (problem transport-problem)
  (:domain transport)

  (:objects
    ;; trucks
    truck_0 truck_1 - truck
    ;; airplanes
    airplane_0 airplane_1 - airplane
    ;; packages
    package_0 package_1 package_2 package_3 - package
    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; city membership (explicit in_city facts)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; same-city pairs (explicit; required by drive precondition)
    (same_city location_0_0 location_0_1)
    (same_city location_0_1 location_0_0)
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; allowed flight routes (explicit as provided)
    (can_fly location_1_0 location_0_0)
    (can_fly location_0_0 location_1_0)

    ;; initial vehicle locations
    (at_v truck_0 location_0_1)
    (at_v truck_1 location_1_1)
    (at_v airplane_0 location_1_0)
    (at_v airplane_1 location_1_0)

    ;; airplanes are on the ground at their start airports
    (on_ground airplane_0)
    (on_ground airplane_1)

    ;; initial package on-ground locations
    (at package_0 location_0_1)
    (at package_1 location_1_1)
    (at package_2 location_1_0)
    (at package_3 location_1_1)

    ;; No busy(...) or locked(...) facts asserted initially (they default to false).
    ;; That enforces precondition checks but keeps initial state non-blocking.
  )

  (:goal (and
    ;; mandated package final placements (all treated as hard constraints)
    (at package_0 location_0_0)
    (at package_1 location_1_0)
    (at package_2 location_0_1)
    (at package_3 location_1_1)
  ))
)