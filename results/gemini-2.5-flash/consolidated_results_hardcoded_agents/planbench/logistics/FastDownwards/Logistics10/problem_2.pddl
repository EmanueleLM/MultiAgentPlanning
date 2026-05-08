(define (problem Logistics10-Problem)
    (:domain logistics)
    (:objects
        city_0 city_1 - city
        location_0_0 location_1_0 location_0_1 location_1_1 - location
        truck_0 truck_1 - truck
        airplane_0 - airplane
        package_0 package_1 package_2 - package
    )
    
    (:init
        ; City/Location definitions
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        
        ; Airport definitions
        (is-airport location_0_0)
        (is-airport location_1_0)
        
        ; Connectivity (Intra-city connections: all locations within a city are connected)
        ; City 0
        (connected location_0_0 location_0_1)
        (connected location_0_1 location_0_0)
        ; City 1
        (connected location_1_0 location_1_1)
        (connected location_1_1 location_1_0)
        
        ; Initial Vehicle positions
        (at-airplane airplane_0 location_0_0)
        (at-truck truck_0 location_0_0)
        (at-truck truck_1 location_1_0)
        
        ; Initial Package positions
        (at-package package_0 location_0_0)
        (at-package package_1 location_1_1)
        (at-package package_2 location_0_1)
        
        ; Initial cost
        (= (total-cost) 0)
    )
    
    (:goal (and
        (at-package package_0 location_1_0)
        (at-package package_1 location_1_0)
        (at-package package_2 location_1_0)
    ))
    
    (:metric minimize (total-cost))