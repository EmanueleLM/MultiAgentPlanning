(define (problem transport-logistics)
  (:domain logistics)
  (:objects
    city_0 - object
    city_1 - object
    location_0_0 location_0_1 location_0_2 - location
    location_1_0 location_1_1 location_1_2 - location
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 - package
  )
  (:init
    (at airplane_0 location_0_0)
    (at_package package_0 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_2)
    (airport location_0_0)
    (airport location_1_0)
    (city_location location_0_0 city_0)
    (city_location location_0_1 city_0)
    (city_location location_0_2 city_0)
    (city_location location_1_0 city_1)
    (city_location location_1_1 city_1)
    (city_location location_1_2 city_1)
  )
  (:goal
    (at_package package_0 location_1_1)
  )
)