(define (problem logistics-9-task)
    (:domain logistics-hard)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
    )

    (:init
        ; City structure and location type
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (is-airport location_0_0)
        (is-airport location_1_0)

        ; Vehicle locations
        (at-vehicle truck_0 location_0_0)
        (at-vehicle truck_1 location_1_0)
        (at-vehicle airplane_0 location_1_0)
        (at-vehicle airplane_1 location_0_0)

        ; Package locations
        (at-package package_0 location_0_0)
        (at-package package_1 location_1_1)
    )

    (:goal (and
        (at-package package_0 location_0_1)
        (at-package package_1 location_1_0)
    ))
)