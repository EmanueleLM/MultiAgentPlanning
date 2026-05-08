(define (problem logistics-4)
    (:domain logistics)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        airplane_0 - airplane
        package_0 - package
        truck_0 truck_1 - truck
    )
    (:init
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)

        (is-airport location_0_0)
        (is-airport location_1_0)

        (at_airplane airplane_0 location_1_0)
        (at_package package_0 location_1_0)
        (at_truck truck_0 location_0_0)
        (at_truck truck_1 location_1_0)
    )
    (:goal (and
        (at_package package_0 location_1_1)
    ))
)