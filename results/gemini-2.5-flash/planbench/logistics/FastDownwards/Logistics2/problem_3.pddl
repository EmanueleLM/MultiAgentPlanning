(define (problem logistics2-instance)
    (:domain logistics2)
    (:objects
        city_0 city_1 - city
        location_0_0 location_1_0 - location
        airplane_0 - airplane
        package_0 package_1 - package
        truck_0 truck_1 - truck
    )
    (:init
        ; City and airport definitions
        (loc-in-city location_0_0 city_0)
        (is-airport location_0_0)
        (loc-in-city location_1_0 city_1)
        (is-airport location_1_0)

        ; Initial locations of vehicles and packages
        (at airplane_0 location_1_0)
        (at package_0 location_1_0)
        (at package_1 location_1_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)
    )
    (:goal (and
        (at package_0 location_0_0)
        (at package_1 location_0_0)
    ))
)