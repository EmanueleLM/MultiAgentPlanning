(define (problem logistics-task-2-minimized)
    (:domain logistics-unified)
    (:objects
        city_0 city_1 - city
        location_0_0 location_1_0 - airport
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
    )
    (:init
        (= (total-cost) 0) ; Initialize cost fluent

        ;; 1. Geographical Relations (City membership)
        (in-city location_0_0 city_0)
        (in-city location_1_0 city_1)

        ;; 2. Initial Locations (Vehicle and Package)
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)
        (at airplane_0 location_1_0)
        (at package_0 location_1_0)
        (at package_1 location_1_0)
    )
    (:goal (and
        (at package_0 location_0_0)
        (at package_1 location_0_0)
    ))
)