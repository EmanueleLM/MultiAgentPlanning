(define (problem logistics41-p0)
    (:domain logistics41)
    (:objects
        package_0 - package
        truck_0 - truck
        truck_1 - truck
        truck_2 - truck
        airplane_0 - airplane
        location_0_0 - location
        location_1_0 - location
        location_2_0 - location
        city_0 - city
        city_1 - city
        city_2 - city
    )
    (:init
        ; Airport locations
        (is_airport location_0_0)
        (is_airport location_1_0)
        (is_airport location_2_0)

        ; Object locations
        (at airplane_0 location_0_0)
        (at package_0 location_0_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)
        (at truck_2 location_2_0)

        ; Location to city mapping
        (in_city location_0_0 city_0)
        (in_city location_1_0 city_1)
        (in_city location_2_0 city_2)
    )
    (:goal
        (at package_0 location_2_0)
    )
)