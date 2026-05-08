(define (problem logistics14-problem)
  (:domain logistics14)
  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; initial vehicle locations
    (at_airplane airplane_0 location_1_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_1)

    ;; initial package locations (packages not in vehicles)
    (at_package package_0 location_1_0)
    (at_package package_1 location_1_1)
    (at_package package_2 location_0_0)
    (at_package package_3 location_0_1)
  )

  (:goal (and
    (at_package package_0 location_0_1)
    (at_package package_1 location_0_1)
    (at_package package_2 location_1_0)
    (at_package package_3 location_1_0)
  ))
)