(define (problem Logistics26-Problem)
    (:domain Logistics26)
    (:objects
        city0 city1 - city
        location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        package_0 package_1 package_2 - package
    )
    
    (:init
        (= (total-cost) 0)

        ;; City definitions
        (in-city location_0_0 city0) (in-city location_0_1 city0) (in-city location_0_2 city0)
        (in-city location_1_0 city1) (in-city location_1_1 city1) (in-city location_1_2 city1)
        
        ;; Airport definitions
        (airport location_0_0) ; Airport in city 0
        (airport location_1_0) ; Airport in city 1
        
        ;; Connectivity within City 0 (L0_0 Airport) - All locations connected
        (connected location_0_0 location_0_1 city0) (connected location_0_1 location_0_0 city0)
        (connected location_0_0 location_0_2 city0) (connected location_0_2 location_0_0 city0)
        (connected location_0_1 location_0_2 city0) (connected location_0_2 location_0_1 city0)

        ;; Connectivity within City 1 (L1_0 Airport) - All locations connected
        (connected location_1_0 location_1_1 city1) (connected location_1_1 location_1_0 city1)
        (connected location_1_0 location_1_2 city1) (connected location_1_2 location_1_0 city1)
        (connected location_1_1 location_1_2 city1) (connected location_1_2 location_1_1 city1)

        ;; Initial Vehicle Positions
        (at airplane_0 location_1_0)
        (at airplane_1 location_0_0)
        (at truck_0 location_0_1)
        (at truck_1 location_1_1)
        
        ;; Initial Package Positions
        (at package_0 location_1_2)
        (at package_1 location_0_2)
        (at package_2 location_0_2)
    )
    
    (:goal (and
        (at package_0 location_0_0)
        (at package_1 location_1_1)
        (at package_2 location_1_2)
    ))

    (:metric minimize (total-cost))
)