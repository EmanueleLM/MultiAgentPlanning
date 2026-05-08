(define (problem logistics10-problem)
    (:domain logistics10)
    (:objects
        airplane_0 - airplane
        package_0 package_1 package_2 - package
        truck_0 truck_1 - truck
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        city_0 city_1 - city
    )
    (:init
        (at-location airplane_0 location_0_0)
        (at-location package_0 location_0_0)
        (at-location package_1 location_1_1)
        (at-location package_2 location_0_1)
        (at-location truck_0 location_0_0)
        (at-location truck_1 location_1_0)

        (is-airport location_0_0)
        (is-airport location_1_0)

        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
    )
    (:goal
        (and
            (at-location package_0 location_1_0)
            (at-location package_1 location_1_0)
            (at-location package_2 location_1_0)
        )
    )
)