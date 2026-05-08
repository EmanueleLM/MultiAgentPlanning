(define (problem logistics-p6)
    (:domain logistics-domain)
    (:objects
        package_0 - package
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        location_0_0 location_1_0 location_1_1 location_0_1 - location
        city_0 city_1 - city
    )
    (:init
        (= (total-cost) 0)

        ; City Membership
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)

        ; Airport Status
        (is-airport location_0_0)
        (is-airport location_1_0)

        ; Initial Positions
        (at package_0 location_1_1)
        (at airplane_0 location_1_0)
        (at airplane_1 location_0_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_1)
    )
    (:goal (and
        (at package_0 location_0_0)
    ))
    (:metric minimize (total-cost))
)