(define (problem logistics_41_prob)
  (:domain logistics_41)
  (:objects
    package_0 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )
  (:init
    (at package_0 location_0_0)
    (at airplane_0 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at truck_2 location_2_0)
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)
    (is_airport location_0_0)
    (is_airport location_1_0)
    (is_airport location_2_0)
  )
  (:goal
    (at package_0 location_2_0)
  )
)