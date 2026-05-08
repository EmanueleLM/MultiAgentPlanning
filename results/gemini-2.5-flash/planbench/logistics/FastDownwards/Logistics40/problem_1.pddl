(define (problem logistics40-problem)
    (:domain logistics40)
    (:objects
        package_0 package_1 package_2 package_3 package_4 package_5 - package
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
        city_0 city_1 - city
    )
    (:init
        (is_airport location_0_0)
        (is_airport location_1_0)
        (at_airplane airplane_0 location_1_0)
        (at_airplane airplane_1 location_0_0)
        (at_package package_0 location_0_0)
        (at_package package_1 location_0_2)
        (at_package package_2 location_1_0)
        (at_package package_3 location_0_0)
        (at_package package_4 location_1_2)
        (at_package package_5 location_1_1)
        (at_truck truck_0 location_0_2)
        (at_truck truck_1 location_1_2)
        (loc_in_city location_0_0 city_0)
        (loc_in_city location_0_1 city_0)
        (loc_in_city location_0_2 city_0)
        (loc_in_city location_1_0 city_1)
        (loc_in_city location_1_1 city_1)
        (loc_in_city location_1_2 city_1)
        (truck_home_city truck_0 city_0)
        (truck_home_city truck_1 city_1)
    )
    (:goal (and
        (at_package package_0 location_0_2)
        (at_package package_1 location_1_0)
        (at_package package_2 location_1_2)
        (at_package package_3 location_1_1)
        (at_package package_4 location_1_0)
        (at_package package_5 location_1_2)
    ))
)