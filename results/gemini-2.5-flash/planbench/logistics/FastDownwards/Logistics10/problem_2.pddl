(define (problem logistics10_p)
    (:domain logistics10)
    (:objects
        package_0 - package
        package_1 - package
        package_2 - package

        truck_0 - truck
        truck_1 - truck

        airplane_0 - airplane

        location_0_0 - location
        location_0_1 - location
        location_1_0 - location
        location_1_1 - location

        city_0 - city
        city_1 - city
    )
    (:init
        ; Airports
        (is_airport location_0_0)
        (is_airport location_1_0)

        ; Location-City mapping
        (in_city location_0_0 city_0)
        (in_city location_0_1 city_0)
        (in_city location_1_0 city_1)
        (in_city location_1_1 city_1)

        ; Vehicle initial locations
        (at airplane_0 location_0_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)

        ; Package initial locations
        (at package_0 location_0_0)
        (at package_1 location_1_1)
        (at package_2 location_0_1)
    )
    (:goal (and
        (at package_0 location_1_0)
        (at package_1 location_1_0)
        (at package_2 location_1_0)
    ))