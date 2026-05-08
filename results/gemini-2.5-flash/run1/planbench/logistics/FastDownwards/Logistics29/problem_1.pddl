(define (problem logistics29-problem)
    (:domain logistics29)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_0_2 - location
        location_1_0 location_1_1 location_1_2 - location
        airplane_0 - airplane
        truck_0 truck_1 - truck
        package_0 package_1 package_2 package_3 - package
    )
    (:init
        ; City-location mapping
        (loc-in-city location_0_0 city_0)
        (loc-in-city location_0_1 city_0)
        (loc-in-city location_0_2 city_0)
        (loc-in-city location_1_0 city_1)
        (loc-in-city location_1_1 city_1)
        (loc-in-city location_1_2 city_1)

        ; Airport identification
        (is-airport location_0_0)
        (is-airport location_1_0)

        ; Initial positions
        (at airplane_0 location_1_0)
        (at package_0 location_0_1)
        (at package_1 location_1_0)
        (at package_2 location_0_1)
        (at package_3 location_0_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_2)
    )
    (:goal (and
        (at package_0 location_1_2)
        (at package_1 location_0_1)
        (at package_2 location_1_2)
        (at package_3 location_0_2)
    ))
)