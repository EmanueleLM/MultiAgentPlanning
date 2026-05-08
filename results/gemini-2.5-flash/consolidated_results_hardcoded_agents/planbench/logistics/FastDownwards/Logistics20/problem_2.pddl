(define (problem logistics-p20)
  (:domain logistics20)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package
  )
  (:init
    ; City definitions
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ; Airport definitions
    (airport location_0_0)
    (airport location_1_0)

    ; Initial locations of vehicles and packages
    (at airplane_0 location_0_0)
    (at airplane_1 location_1_0)
    (at package_0 location_1_1)
    (at truck_0 location_0_1)
    (at truck_1 location_1_0)

    ; Initial Cost
    (= (total-cost) 0)
  )
  (:goal (and
    (at package_0 location_1_2)
  ))
  (:metric minimize (total-cost))
)