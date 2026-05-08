(define (problem logistics_problem)
  (:domain logistics)
  (:objects 
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 - package
    location_0_0 location_0_1 - location
    location_1_0 location_1_1 - location
    city_0 city_1 - city
  )
  (:init 
    (at airplane_0 location_1_0)
    (at airplane_1 location_0_0)
    (at package_0 location_0_0)
    (at package_1 location_1_1)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (airport location_0_0)
    (airport location_1_0)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
  )
  (:goal 
    (and 
      (at package_0 location_0_1)
      (at package_1 location_1_0)
    )
  )
)