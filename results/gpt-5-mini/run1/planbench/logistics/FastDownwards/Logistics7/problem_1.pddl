(define (problem logistics7)
  (:domain logistics)
  (:objects
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; vehicle locations
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_1)

    ;; packages at locations
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_0)

    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
  )

  (:goal (and
    (at-package package_0 location_1_0)
    (at-package package_1 location_0_0)
  ))
)