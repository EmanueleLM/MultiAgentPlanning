(define (problem logistics_task)
  (:domain logistics_orchestrated)

  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    (is_airport location_0_0)
    (is_airport location_1_0)

    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)

    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_1)

    (at_airplane airplane_0 location_1_0)
    (at_airplane airplane_1 location_1_0)

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