(define (problem city_logistics_problem)
  (:domain city_logistics)

  (:objects
    city_0 city_1 - city
    location_0_0 location_1_0 - airport
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 - package
  )

  (:init
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)

    (truck_assigned_to_city truck_0 city_0)
    (truck_assigned_to_city truck_1 city_1)

    (air_route location_0_0 location_1_0)
    (air_route location_1_0 location_0_0)

    (at airplane_0 location_0_0)
    (at airplane_1 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)

    (at_package package_0 location_1_0)
    (at_package package_1 location_1_0)
  )

  (:goal (and
    (at_package package_0 location_1_0)
    (at_package package_1 location_0_0)
  ))
)