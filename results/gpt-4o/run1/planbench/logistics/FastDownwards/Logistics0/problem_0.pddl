(define (problem logistics_problem)
  (:domain logistics)
  (:objects
    location_0_0 location_1_0 - location
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    city_0 city_1 - city
  )
  (:init
    (is_airport location_0_0)
    (is_airport location_1_0)
    (airplane_at airplane_0 location_1_0)
    (airplane_at airplane_1 location_1_0)
    (at_location package_0 location_1_0)
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
  )
  (:goal
    (at_location package_0 location_0_0)
  )
)