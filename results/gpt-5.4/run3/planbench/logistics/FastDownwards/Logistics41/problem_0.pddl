(define (problem logistics_instance_specific_problem)
  (:domain logistics_instance_specific)

  (:objects
    city_0 city_1 city_2 - city
    location_0_0 location_1_0 location_2_0 - location
    package_0 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 - airplane
  )

  (:init
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)

    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)
    (truck_in_city truck_2 city_2)

    (same_city_road location_0_0 location_0_0 city_0)
    (same_city_road location_1_0 location_1_0 city_1)
    (same_city_road location_2_0 location_2_0 city_2)

    (air_link location_0_0 location_1_0)
    (air_link location_0_0 location_2_0)
    (air_link location_1_0 location_0_0)
    (air_link location_1_0 location_2_0)
    (air_link location_2_0 location_0_0)
    (air_link location_2_0 location_1_0)

    (at_airplane airplane_0 location_0_0)
    (at_package package_0 location_0_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)
  )

  (:goal
    (and
      (at_package package_0 location_2_0)
    )
  )
)