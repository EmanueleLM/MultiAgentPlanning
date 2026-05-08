(define (problem logistics_task)
  (:domain logistics_orchestrated)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ;; location -> city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ;; airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; different-city between airports (both directions)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)

    ;; initial vehicle positions
    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_1)

    (at_airplane airplane_0 location_1_0)
    (at_airplane airplane_1 location_1_0)

    ;; initial package positions
    (at_package package_0 location_0_1)
    (at_package package_1 location_1_1)
    (at_package package_2 location_1_0)
    (at_package package_3 location_1_1)
  )

  (:goal (and
    (at_package package_0 location_0_0)
    (at_package package_1 location_1_0)
    (at_package package_2 location_0_1)
    (at_package package_3 location_1_1)
  ))
)