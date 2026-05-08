(define (problem logistics2-instance)
    (:domain logistics2)
    (:objects
        city_0 city_1 - city
        location_0_0 location_1_0 - location ; Type changed to generic location
        airplane_0 - airplane
        package_0 package_1 - package
        truck_0 truck_1 - truck
    )
    (:init
        ; City definitions
        (loc-in-city location_0_0 city_0)
        (loc-in-city location_1_0 city_1)

        ; Airport definitions
        (is-airport location_0_0) ; Fact added to mark location_0_0 as an airport
        (is-airport location_1_0) ; Fact added to mark location_1_0 as an airport

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