(define (problem logistics-task-24)
    (:domain logistics24)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
        package_0 package_1 package_2 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
    )
    (:init
        (= (total-cost) 0) ; Initialize cost

        ; City definitions and connections
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ; Airport designations
        (is-airport location_0_0)
        (is-airport location_1_0)

        ; Vehicle initial positions
        (at airplane_0 location_1_0)
        (at truck_0 location_0_2)
        (at truck_1 location_1_2)

        ; Package initial positions
        (at package_0 location_1_2)
        (at package_1 location_0_1)
        (at package_2 location_1_1)
    )
    (:goal (and
        (at package_0 location_1_0)
        (at package_1 location_1_0)
        (at package_2 location_1_2)
    ))
    (:metric minimize (total-cost))
)