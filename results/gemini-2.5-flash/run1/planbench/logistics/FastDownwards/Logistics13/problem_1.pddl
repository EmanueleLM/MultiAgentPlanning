(define (problem logistics13)
    (:domain logistics)
    (:objects
        package_0 package_1 package_2 - package
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        city_0 city_1 - city
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
    )
    (:init
        ;; Locations in cities
        (in_city location_0_0 city_0)
        (in_city location_0_1 city_0)
        (in_city location_1_0 city_1)
        (in_city location_1_1 city_1)

        ;; Airport locations
        (is_airport location_0_0)
        (is_airport location_1_0)

        ;; Initial vehicle positions
        (at_vehicle airplane_0 location_1_0)
        (at_vehicle airplane_1 location_0_0)
        (at_vehicle truck_0 location_0_0)
        (at_vehicle truck_1 location_1_1)

        ;; Initial package positions
        (at_package package_0 location_1_0)
        (at_package package_1 location_1_1)
        (at_package package_2 location_0_0)
    )
    (:goal
        (and
            (at_package package_0 location_0_1)
            (at_package package_1 location_0_1)
            (at_package package_2 location_0_1)
        )
    )
)