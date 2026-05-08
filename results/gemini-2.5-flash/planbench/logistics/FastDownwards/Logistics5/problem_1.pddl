(define (problem logistics5_problem)
    (:domain logistics)
    (:objects
        package_0 - package
        truck_0 - truck
        truck_1 - truck
        airplane_0 - airplane
        location_0_0 location_1_0 - airport
        location_0_1 location_1_1 - location
        city_0 city_1 - city
    )

    (:init
        (at airplane_0 location_0_0)
        (at package_0 location_0_1)
        (at truck_0 location_0_0)
        (at truck_1 location_1_1)

        (in_city location_0_0 city_0)
        (in_city location_0_1 city_0)
        (in_city location_1_0 city_1)
        (in_city location_1_1 city_1)
    )

    (:goal
        (at package_0 location_1_0)
    )
)