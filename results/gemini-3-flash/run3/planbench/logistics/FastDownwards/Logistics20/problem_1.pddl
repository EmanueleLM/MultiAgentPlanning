(define (problem logistics_20)
  (:domain logistics)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 - location
    location_1_0 location_1_1 location_1_2 - location
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
  )

  (:init
    (is_airport location_0_0)
    (is_airport location_1_0)
    (at airplane_0 location_0_0)
    (at airplane_1 location_1_0)
    (at package_0 location_1_1)
    (at truck_0 location_0_1)
    (at truck_1 location_1_0)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)
  )

  (:goal (and
    (at package_0 location_1_2)
  ))
)