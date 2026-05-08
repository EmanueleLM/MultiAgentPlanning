(define (problem logistics-task)
    (:domain logistics)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        package_0 package_1 package_2 package_3 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
    )

    (:init
        ;; City membership
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)

        ;; Airports
        (airport location_0_0)
        (airport location_1_0)

        ;; Vehicle Locations
        (at airplane_0 location_0_0)
        (at truck_0 location_0_1)
        (at truck_1 location_1_1)

        ;; Package Locations
        (at-pkg package_0 location_1_1)
        (at-pkg package_1 location_1_0)
        (at-pkg package_2 location_1_1)
        (at-pkg package_3 location_0_0)
    )

    (:goal (and
        (at-pkg package_0 location_0_0)
        (at-pkg package_1 location_1_1)
        (at-pkg package_2 location_0_1)
        (at-pkg package_3 location_1_1)
    ))
)