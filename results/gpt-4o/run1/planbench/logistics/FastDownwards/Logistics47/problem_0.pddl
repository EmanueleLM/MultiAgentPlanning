(define (problem logistics-instance)
  (:domain logistics)
  (:objects
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
    truck_0 truck_1 truck_2 - truck
    airplane_0 - airplane
    package_0 package_1 - package
  )
  (:init
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)
    (at airplane_0 location_1_0)
    (at package_0 location_1_0)
    (at package_1 location_2_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at truck_2 location_2_0)
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)
    (in-city location_2_0 city_2)
  )
  (:goal
    (and
      (at package_0 location_2_0)
      (at package_1 location_0_0)
    )
  )
)