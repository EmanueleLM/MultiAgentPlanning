(define (problem logistics22_problem)
    (:domain logistics22)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_0_2 - location
        location_1_0 location_1_1 location_1_2 - location
        airplane_0 - airplane
        package_0 package_1 - package
        truck_0 truck_1 - truck
    )

    (:init
        ; City-Location mappings
        (in_city location_0_0 city_0)
        (in_city location_0_1 city_0)
        (in_city location_0_2 city_0)
        (in_city location_1_0 city_1)
        (in_city location_1_1 city_1)
        (in_city location_1_2 city_1)

        ; Airports
        (is_airport location_0_0)
        (is_airport location_1_0)

        ; Vehicle initial positions
        (at airplane_0 location_1_0)
        (at truck_0 location_0_2)
        (at truck_1 location_1_2)

        ; Package initial positions
        (at_package package_0 location_0_1)
        (at_package package_1 location_1_2)
    )

    (:goal (and
        (at_package package_0 location_0_2)
        (at_package package_1 location_1_0)
    ))
)