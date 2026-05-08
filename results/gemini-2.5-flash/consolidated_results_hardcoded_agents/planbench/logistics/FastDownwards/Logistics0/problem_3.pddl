(define (problem integrated-logistics-delivery)
    (:domain ground-air-logistics)
    (:objects
        city_0 city_1 - city
        location_0_0 location_1_0 - location
        package_0 - package
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
    )

    (:init
        ;; City and Location Definition
        (in-city location_0_0 city_0)
        (in-city location_1_0 city_1)

        ;; Airport Status (Required for airplane actions)
        (is-airport location_0_0)
        (is-airport location_1_0)

        ;; Initial Vehicle and Package Locations
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)
        
        (at airplane_0 location_1_0)
        (at airplane_1 location_1_0)
        
        (at package_0 location_1_0)
        
        (= (total-cost) 0)
    )

    (:goal
        (at package_0 location_0_0)
    )
    
    (:metric minimize (total-cost))
)