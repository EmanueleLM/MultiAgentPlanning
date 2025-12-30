(define (problem Logistics28)
    (:domain logistics-transport)
    (:objects
        package_0 package_1 package_2 package_3 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
        location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
        city_0 city_1 - city
    )
    
    (:init
        ;; City membership
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ;; Airports
        (airport location_0_0)
        (airport location_1_0)

        ;; Initial Locations
        (at airplane_0 location_1_0)
        
        (at package_0 location_1_2)
        (at package_1 location_0_0)
        (at package_2 location_0_2)
        (at package_3 location_1_1)
        
        (at truck_0 location_0_1)
        (at truck_1 location_1_1)
    )
    
    (:goal
        (and
            (at package_0 location_1_1)
            (at package_1 location_1_0)
            (at package_2 location_0_0)
            (at package_3 location_0_2)
        )
    )
)