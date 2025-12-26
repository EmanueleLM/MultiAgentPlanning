(define (problem Logistics22-P0-P1)
    (:domain logistics-temporal-consistent)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_0_2 
        location_1_0 location_1_1 location_1_2 - location
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
    )

    (:init
        ; City assignments
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ; Airport designations
        (is-airport location_0_0)
        (is-airport location_1_0)

        ; Initial Vehicle Positions
        (at airplane_0 location_1_0) ; Airport in city_1
        (at truck_0 location_0_2)    ; In city_0
        (at truck_1 location_1_2)    ; In city_1

        ; Initial Package Positions
        (at-loc package_0 location_0_1) ; In city_0
        (at-loc package_1 location_1_2) ; In city_1
    )

    (:goal
        (and (at-loc package_0 location_0_2)
             (at-loc package_1 location_1_0))
    )
)