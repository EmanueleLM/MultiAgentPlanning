(define (problem logistics-7-p0)
    (:domain logistics-7)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        truck_0 truck_1 - truck
        airplane_0 - airplane
        package_0 package_1 - package
    )
    
    (:init
        (= (total-cost) 0)

        ; City Membership
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)

        ; Airport Status
        (airport location_0_0)
        (airport location_1_0)

        ; Vehicle locations
        (at airplane_0 location_1_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_1)

        ; Package locations
        (at package_0 location_1_1)
        (at package_1 location_0_0)
    )

    (:goal (and
        (at package_0 location_1_0)
        (at package_1 location_0_0)
    ))

    (:metric minimize (total-cost))
)