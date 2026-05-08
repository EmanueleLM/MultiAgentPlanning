(define (problem logistics7-problem)
  (:domain logistics7)

  (:objects
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; vehicle locations
    (at-plane airplane_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_1)

    ;; packages
    (at-pkg package_0 location_1_1)
    (at-pkg package_1 location_0_0)

    ;; location to city membership
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)
  )

  (:goal (and
    (at-pkg package_0 location_1_0)
    (at-pkg package_1 location_0_0)
  ))
)