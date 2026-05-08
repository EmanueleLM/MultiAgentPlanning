(define (problem logistics-instance)
  (:domain logistics)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 package_2 package_3 - package
  )
  (:init
    (is-airport location_0_0)
    (is-airport location_1_0)
    (at airplane_0 location_1_0)
    (at-location package_0 location_1_0)
    (at-location package_1 location_1_1)
    (at-location package_2 location_0_0)
    (at-location package_3 location_0_1)
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
  )
  (:goal (and
    (at-location package_0 location_0_1)
    (at-location package_1 location_0_1)
    (at-location package_2 location_1_0)
    (at-location package_3 location_1_0)
  ))
)