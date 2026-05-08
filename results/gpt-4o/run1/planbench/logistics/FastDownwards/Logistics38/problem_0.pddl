(define (problem logistics-instance)
        (:domain logistics)
        (:objects
            location_0_0 location_0_1 location_0_2 - location
            location_1_0 location_1_1 location_1_2 - location
            truck_0 truck_1 - truck
            airplane_0 airplane_1 - airplane
            package_0 package_1 package_2 package_3 package_4 package_5 - package
            city_0 city_1 - city
        )
        (:init
            (airport location_0_0)
            (airport location_1_0)
            (at location_0_0 airplane_0)
            (at location_1_0 airplane_1)
            (at location_1_0 package_0)
            (at location_1_1 package_1)
            (at location_1_2 package_2)
            (at location_1_1 package_3)
            (at location_0_1 package_4)
            (at location_0_1 package_5)
            (at location_0_0 truck_0)
            (at location_1_1 truck_1)
            (city_of location_0_0 city_0)
            (city_of location_0_1 city_0)
            (city_of location_0_2 city_0)
            (city_of location_1_0 city_1)
            (city_of location_1_1 city_1)
            (city_of location_1_2 city_1)
        )
        (:goal (and
            (at location_0_0 package_0)
            (at location_1_1 package_1)
            (at location_0_2 package_2)
            (at location_0_0 package_3)
            (at location_1_0 package_4)
            (at location_0_1 package_5)
        ))
    )