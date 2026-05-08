(define (problem logistics_instance)
  (:domain logistics)
  (:objects
    airplane_0 airplane_1 - plane
    truck_0 truck_1 - truck
    package_0 package_1 package_2 - package
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    (at_plane airplane_0 location_1_0)
    (at_plane airplane_1 location_0_0)
    (at_package package_0 location_1_2)
    (at_package package_1 location_0_2)
    (at_package package_2 location_0_2)
    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_1)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)
    (is_airport location_0_0)
    (is_airport location_1_0)
  )

  (:goal
    (and
      (at_package package_0 location_0_0)
      (at_package package_1 location_1_1)
      (at_package package_2 location_1_2)
    )
  )
)