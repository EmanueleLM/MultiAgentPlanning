(define (problem logistics34-problem)
  (:domain logistics34)
  (:objects
    package_0 package_1 package_2 package_3 package_4 - package
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    airplane_0 airplane_1 - airplane
    truck_0 truck_1 - truck
    city_0 city_1 - city
  )
  (:init
    (is_airport location_0_0)
    (is_airport location_1_0)
    (vehicle_at airplane_0 location_0_0)
    (vehicle_at airplane_1 location_1_0)
    (package_at package_0 location_0_1)
    (package_at package_1 location_1_0)
    (package_at package_2 location_1_0)
    (package_at package_3 location_0_0)
    (package_at package_4 location_1_2)
    (vehicle_at truck_0 location_0_2)
    (vehicle_at truck_1 location_1_1)
    (loc_is_city location_0_0 city_0)
    (loc_is_city location_0_1 city_0)
    (loc_is_city location_0_2 city_0)
    (loc_is_city location_1_0 city_1)
    (loc_is_city location_1_1 city_1)
    (loc_is_city location_1_2 city_1)
  )
  (:goal
    (and
      (package_at package_0 location_0_1)
      (package_at package_1 location_0_1)
      (package_at package_2 location_0_0)
      (package_at package_3 location_0_0)
      (package_at package_4 location_1_0)
    )
  )
)