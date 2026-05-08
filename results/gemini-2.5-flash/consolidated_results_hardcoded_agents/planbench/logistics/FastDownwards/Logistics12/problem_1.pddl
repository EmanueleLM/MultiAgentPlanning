(define (problem logistics12-orchestrator)
    (:domain logistics)
    (:objects
        c0 c1 - city
        location_0_0 location_0_1 location_1_0 location_1_1 - location
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        package_0 package_1 package_2 - package
    )

    (:init
        ; City and Location definitions
        (in-city location_0_0 c0)
        (in-city location_0_1 c0)
        (in-city location_1_0 c1)
        (in-city location_1_1 c1)

        ; Airport definitions
        (is-airport location_0_0) ; City 0 airport
        (is-airport location_1_0) ; City 1 airport

        ; Truck assignments and initial locations
        (in-city-truck truck_0 c0)
        (at truck_0 location_0_1)
        (in-city-truck truck_1 c1)
        (at truck_1 location_1_0)

        ; Connectivity within cities (assuming bi-directional connections)
        (connected location_0_0 location_0_1 c0)
        (connected location_0_1 location_0_0 c0)
        (connected location_1_0 location_1_1 c1)
        (connected location_1_1 location_1_0 c1)

        ; Airplane locations
        (at airplane_0 location_0_0)
        (at airplane_1 location_1_0)

        ; Package locations
        (at package_0 location_1_1)
        (at package_1 location_0_0)
        (at package_2 location_0_0)

        ; Cost initialization
        (= (total-cost) 0)
    )

    (:goal (and
        (at package_0 location_0_1)
        (at package_1 location_1_1)
        (at package_2 location_1_0)
    ))

    (:metric minimize (total-cost))
)