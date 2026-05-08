(define (problem logistics_34_prob)
  (:domain logistics_34)
  (:objects
    package_0 package_1 package_2 package_3 package_4 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )
  (:init
    ;; Airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; City Locations
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ;; Initial positions of vehicles
    (at truck_0 location_0_2)
    (at truck_1 location_1_1)
    (at airplane_0 location_0_0)
    (at airplane_1 location_1_0)

    ;; Initial positions of packages
    (at package_0 location_0_1)
    (at package_1 location_1_0)
    (at package_2 location_1_0)
    (at package_3 location_0_0)
    (at package_4 location_1_2)
  )
  (:goal
    (and
      (at package_0 location_0_1)
      (at package_1 location_0_1)
      (at package_2 location_0_0)
      (at package_3 location_0_0)
      (at package_4 location_1_0)
    )
  )
)