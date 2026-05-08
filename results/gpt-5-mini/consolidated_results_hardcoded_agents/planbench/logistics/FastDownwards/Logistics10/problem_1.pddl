(define (problem logistics-instance-1)
  (:domain logistics-multiagent)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 package_2 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    ;; city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; same-city (symmetric) for locations in the same city
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)

    ;; different: all ordered pairs of distinct locations
    (different location_0_0 location_0_1)
    (different location_0_0 location_1_0)
    (different location_0_0 location_1_1)
    (different location_0_1 location_0_0)
    (different location_0_1 location_1_0)
    (different location_0_1 location_1_1)
    (different location_1_0 location_0_0)
    (different location_1_0 location_0_1)
    (different location_1_0 location_1_1)
    (different location_1_1 location_0_0)
    (different location_1_1 location_0_1)
    (different location_1_1 location_1_0)

    ;; initial vehicle and package locations (dynamic state)
    (at-airplane airplane_0 location_0_0)

    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    (at-package package_0 location_0_0)
    (at-package package_1 location_1_1)
    (at-package package_2 location_0_1)
  )

  (:goal (and
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_1_0)
  ))
)