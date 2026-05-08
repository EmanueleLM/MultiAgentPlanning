(define (problem intermodal-transport-problem)
  (:domain intermodal-transport)

  (:objects
    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 package_2 package_3 - package

    ;; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; initial vehicle and package positions
    (at-airplane airplane_0 location_1_0)

    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    (at-package package_0 location_1_2)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_2)
    (at-package package_3 location_1_1)

    ;; capacity bookkeeping: all vehicles start empty
    (truck-empty truck_0)
    (truck-empty truck_1)
    (airplane-empty airplane_0)

    ;; location -> city mapping
    (loc-city location_0_0 city_0)
    (loc-city location_0_1 city_0)
    (loc-city location_0_2 city_0)

    (loc-city location_1_0 city_1)
    (loc-city location_1_1 city_1)
    (loc-city location_1_2 city_1)

    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)
  )

  (:goal (and
    (at-package package_0 location_1_1)
    (at-package package_1 location_1_0)
    (at-package package_2 location_0_0)
    (at-package package_3 location_0_2)
  ))
)