(define (problem logistics-problem)
  (:domain logistics)
  (:objects
    city_0 city_1 city_2 - city
    location_0_0 location_1_0 location_2_0 - location
    truck_0 truck_1 truck_2 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package)
  (:init
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)
    (at airplane_0 location_2_0)
    (at airplane_1 location_0_0)
    (at package_0 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at truck_2 location_2_0)
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2))
  (:goal
    (at package_0 location_1_0))
)