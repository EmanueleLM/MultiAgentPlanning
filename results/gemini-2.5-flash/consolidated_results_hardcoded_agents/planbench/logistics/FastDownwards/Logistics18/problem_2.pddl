(define (problem logistics18-problem)
    (:domain logistics)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
        package_0 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
    )

    (:init
        ;; City membership definitions
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ;; Airport definitions
        (is-airport location_0_0)
        (is-airport location_1_0)

        ;; Initial placements
        (at airplane_0 location_1_0)
        (at package_0 location_0_1)
        (at truck_0 location_0_2)
        (at truck_1 location_1_0)

        (= (total-cost) 0)
    )

    (:goal 
        (at package_0 location_1_2)
    )
    
    (:metric minimize (total-cost))
)