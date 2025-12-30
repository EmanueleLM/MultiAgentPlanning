(define (problem complex-multi-agent-logistics)
    (:domain unified-logistics)
    (:objects
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        location_0_0 location_1_0 - location
        city_0 city_1 - city
    )

    (:init
        ;; City Structure (Locations are fixed airports/terminals)
        (in-city location_0_0 city_0)
        (in-city location_1_0 city_1)

        ;; Initial Vehicle Locations
        ; Vehicles starting at location_0_0 (City 0)
        (at truck_0 location_0_0)
        (at airplane_0 location_0_0)
        (at airplane_1 location_0_0)

        ; Vehicle starting at location_1_0 (City 1)
        (at truck_1 location_1_0)

        ;; Initial Package Locations
        ; Packages starting at location_1_0 (City 1)
        (at package_0 location_1_0)
        (at package_1 location_1_0)
    )

    (:goal (and
        (at package_0 location_1_0) ; P0 must remain at its starting location (City 1)
        (at package_1 location_0_0) ; P1 must be moved to location_0_0 (City 0)
    ))
)