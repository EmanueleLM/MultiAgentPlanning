(define (problem logistics_problem_7)
  (:domain logistics_city_transport)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
  )

  (:init
    ;; Airplane location
    (at airplane_0 location_1_0)
    
    ;; Package locations
    (at package_0 location_1_1)
    (at package_1 location_0_0)
    
    ;; Truck locations
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)
    
    ;; City structure
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    
    ;; Airport locations
    (is_airport location_0_0)
    (is_airport location_1_0)
  )

  (:goal
    (and
      (at package_0 location_1_0)
      (at package_1 location_0_0)
    )
  )
)