(define (problem logistics17-problem)
  (:domain logistics17)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 package_2 package_3 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    ;; city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; allowed flight routes (explicit)
    (can_fly location_1_0 location_0_0)
    (can_fly location_0_0 location_1_0)

    ;; initial vehicle locations
    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_1)
    (at_airplane airplane_0 location_1_0)
    (at_airplane airplane_1 location_1_0)

    ;; initial package locations (on ground)
    (at package_0 location_0_1)
    (at package_1 location_1_1)
    (at package_2 location_1_0)
    (at package_3 location_1_1)
  )

  (:goal (and
    (at package_0 location_0_0)
    (at package_1 location_1_0)
    (at package_2 location_0_1)
    (at package_3 location_1_1)
  ))
)