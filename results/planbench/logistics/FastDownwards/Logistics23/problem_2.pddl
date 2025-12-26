(define (problem logistics-23-planning)
    (:domain Logistics)
    (:objects
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        location_0_0 location_0_1 location_0_2 
        location_1_0 location_1_1 location_1_2 - location
        city_0 city_1 - city
    )
    
    (:init
        ;; 1. City Definitions
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ;; 2. Airport Definitions
        (is-airport location_0_0)
        (is-airport location_1_0)

        ;; 3. Connectivity (All locations in a city are connected)
        ; City 0 Connections
        (connected location_0_0 location_0_1) (connected location_0_1 location_0_0)
        (connected location_0_0 location_0_2) (connected location_0_2 location_0_0)
        (connected location_0_1 location_0_2) (connected location_0_2 location_0_1)
        ; City 1 Connections
        (connected location_1_0 location_1_1) (connected location_1_1 location_1_0)
        (connected location_1_0 location_1_2) (connected location_1_2 location_1_0)
        (connected location_1_1 location_1_2) (connected location_1_2 location_1_1)

        ;; 4. Initial Object Locations
        ; Trucks
        (at truck_0 location_0_2)
        (at truck_1 location_1_2)
        
        ; Airplanes
        (at airplane_0 location_1_0)
        (at airplane_1 location_1_0)
        
        ; Packages
        (at package_0 location_1_2)
        (at package_1 location_0_1)
    )
    
    (:goal (and
        (at package_0 location_1_1)
        (at package_1 location_1_0)
    ))