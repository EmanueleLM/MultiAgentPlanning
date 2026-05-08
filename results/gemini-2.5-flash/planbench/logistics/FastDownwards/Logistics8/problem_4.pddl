(define (problem Logistics8-Problem)
  (:domain Logistics8)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    airplane_0 - airplane
    truck_0 truck_1 - truck
    package_0 package_1 - package
  )
  (:init
    (is-airport location_0_0)
    (is-airport location_1_0)

    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    (at airplane_0 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    (at package_0 location_0_0)
    (at package_1 location_0_0)
  )
  (:goal (and (at package_0 location_0_1)
              (at package_1 location_0_1)))