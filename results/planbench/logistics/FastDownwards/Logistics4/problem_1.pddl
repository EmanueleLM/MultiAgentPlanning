(define (problem logistics-4)
    (:domain logistics)
    (:objects
        package_0 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        city_0 city_1 - city
    )
    (:init
        ;; City Structure definitions
        (loc-in-city location_0_0 city_0)
        (loc-in-city location_0_1 city_0)
        (loc-in-city location_1_0 city_1)
        (loc-in-city location_1_1 city_1)

        ;; Airport designations
        (airport location_0_0)
        (airport location_1_0)

        ;; Initial Positions
        (at airplane_0 location_1_0)
        (at package_0 location_1_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)
    )
    (:goal
        (at package_0 location_1_1)
    )
)