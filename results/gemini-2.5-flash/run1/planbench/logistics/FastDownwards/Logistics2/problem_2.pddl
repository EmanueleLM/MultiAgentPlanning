(define (problem logistics2-problem)
    (:domain logistics2)
    (:objects
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
        city_0 city_1 - city
        location_0_0 location_1_0 - airport_location
    )
    (:init
        (at airplane_0 location_1_0)
        (at package_0 location_1_0)
        (at package_1 location_1_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)
        (in-city location_0_0 city_0)
        (in-city location_1_0 city_1)
    )
    (:goal (and
        (at package_0 location_0_0)
        (at package_1 location_0_0)
    ))
)