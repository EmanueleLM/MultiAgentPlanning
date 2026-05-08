(define (problem logistics_14)
  (:domain logistics)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    package_0 package_1 package_2 package_3 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
  )

  (:init
    ;; Location connectivity and types
    (in_city location_0_0 city_0)
    (is_airport location_0_0)
    (in_city location_0_1 city_0)
    
    (in_city location_1_0 city_1)
    (is_airport location_1_0)
    (in_city location_1_1 city_1)

    ;; Initial positions of vehicles
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)
    (at airplane_0 location_1_0)

    ;; Initial positions of packages
    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_0_0)
    (at package_3 location_0_1)
  )

  (:goal
    (and
      (at package_0 location_0_1)
      (at package_1 location_0_1)
      (at package_2 location_1_0)
      (at package_3 location_1_0)
    )
  )
)