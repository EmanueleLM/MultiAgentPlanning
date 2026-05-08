(define (problem logistics-task-2)
    (:domain logistics-unified)
    (:objects
        city_0 city_1 - city
        location_0_0 location_1_0 - location
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
    )
    (:init
        ;; City membership
        (in-city location_0_0 city_0)
        (in-city location_1_0 city_1)

        ;; Airport status
        (is-airport location_0_0)
        (is-airport location_1_0)

        ;; Initial locations of vehicles
        (at truck_0 location_0_0)
        (at truck_1 location_1_0)
        (at airplane_0 location_1_0)

        ;; Initial locations of packages
        (at package_0 location_1_0)
        (at package_1 location_1_0)
    )
    (:goal (and
        (at package_0 location_0_0)
        (at package_1 location_0_0)
    ))
)