(define (problem logistics_9)
  (:domain logistics)
  (:objects
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )
  (:init
    (at package_0 location_0_0)
    (at package_1 location_1_1)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at airplane_0 location_1_0)
    (at airplane_1 location_0_0)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (is_airport location_0_0)
    (is_airport location_1_0)
  )
  (:goal
    (and
      (at package_0 location_0_1)
      (at package_1 location_1_0)
    )
  )
)