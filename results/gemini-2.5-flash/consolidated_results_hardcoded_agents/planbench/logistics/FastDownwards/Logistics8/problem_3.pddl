(define (problem logistics8-p)
    (:domain logistics8)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        airplane_0 - airplane
        truck_0 truck_1 - truck
        package_0 package_1 - package
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; City Definitions
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        
        ;; Airport Definitions
        (airport location_0_0)
        (airport location_1_0)
        
        ;; Initial Vehicle Placement
        (at airplane_0 location_0_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_1)
        
        ;; Initial Package Placement
        (at package_0 location_0_0)
        (at package_1 location_0_0)
    )
    
    (:goal (and
        (at package_0 location_0_1)
        (at package_1 location_0_1)
    ))
    
    (:metric minimize (total-cost))
)