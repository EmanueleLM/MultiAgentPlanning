(define (problem logistics-problem-16)
    (:domain logistics-domain)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        package_0 package_1 package_2 package_3 - package
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; City assignments
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        
        ;; Airport designation
        (is-airport location_0_0)
        (is-airport location_1_0)
        
        ;; Initial vehicle positions
        (at airplane_0 location_0_0)
        (at airplane_1 location_0_0)
        (at truck_0 location_0_1)
        (at truck_1 location_1_1)
        
        ;; Initial package positions
        (at package_0 location_1_1)
        (at package_1 location_1_0)
        (at package_2 location_1_1)
        (at package_3 location_0_0)
    )
    
    (:goal (and
        (at package_0 location_0_0)
        (at package_1 location_1_1)
        (at package_2 location_0_1)
        (at package_3 location_1_1)
    ))

    (:metric minimize (total-cost))
)