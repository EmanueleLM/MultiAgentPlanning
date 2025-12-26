(define (problem Logistics14)
    (:domain logistics-transport)
    (:objects
        package_0 package_1 package_2 package_3 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
        location_0_0 location_0_1 location_1_0 location_1_1 - loc
        city_0 city_1 - city
    )
    
    (:init
        ;; City Structure
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        
        ;; Airport designation
        (airport location_0_0)
        (airport location_1_0)
        
        ;; Initial locations of vehicles
        (at truck_0 location_0_0)
        (at truck_1 location_1_1)
        (at airplane_0 location_1_0)
        
        ;; Initial locations of packages
        (at package_0 location_1_0)
        (at package_1 location_1_1)
        (at package_2 location_0_0)
        (at package_3 location_0_1)
    )
    
    (:goal (and
        (at package_0 location_0_1)
        (at package_1 location_0_1)
        (at package_2 location_1_0)
        (at package_3 location_1_0)
    ))