(define (problem logistics8-instance)
  (:domain logistics8)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; initial vehicle locations
    (at_plane airplane_0 location_0_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_1)

    ;; initial package locations
    (at_package package_0 location_0_0)
    (at_package package_1 location_0_0)
  )

  (:goal (and
    (at_package package_0 location_0_1)
    (at_package package_1 location_0_1)
  ))
)