(define (problem logistics_35_prob)
  (:domain logistics_35)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 - location
    location_1_0 location_1_1 location_1_2 - location
    airplane_0 airplane_1 - airplane
    truck_0 truck_1 - truck
    package_0 package_1 package_2 package_3 package_4 - package
  )
  (:init
    (airport location_0_0)
    (airport location_1_0)
    (at airplane_0 location_1_0)
    (at airplane_1 location_0_0)
    (at package_0 location_1_1)
    (at package_1 location_0_2)
    (at package_2 location_0_2)
    (at package_3 location_0_2)
    (at package_4 location_1_2)
    (at truck_0 location_0_2)
    (at truck_1 location_1_0)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)
  )
  (:goal
    (and
      (at package_0 location_1_1)
      (at package_1 location_0_0)
      (at package_2 location_1_0)
      (at package_3 location_1_0)
      (at package_4 location_0_2)
    )
  )
)