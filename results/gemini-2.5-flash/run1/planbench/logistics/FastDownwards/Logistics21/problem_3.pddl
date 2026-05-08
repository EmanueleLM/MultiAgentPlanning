(define (problem logistics-21)
    (:domain logistics)
    (:objects
        package_0 package_1 - package
        truck_0 truck_1 - truck
        airplane_0 - airplane
        location_0_0 location_0_1 location_0_2 - location
        location_1_0 location_1_1 location_1_2 - location
        city_0 city_1 - city
    )
    (:init
        ;; Initial placement of objects
        (at airplane_0 location_0_0)
        (at package_0 location_1_1)
        (at package_1 location_1_2)
        (at truck_0 location_0_1)
        (at truck_1 location_1_0)

        ;; Location city assignments
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ;; Airport definitions
        (is-airport location_0_0)
        (is-airport location_1_0)

        ;; Connectivity within city_0 (all locations within a city are connected)
        (connected location_0_0 location_0_1)
        (connected location_0_1 location_0_0)
        (connected location_0_0 location_0_2)
        (connected location_0_2 location_0_0)
        (connected location_0_1 location_0_2)
        (connected location_0_2 location_0_1)

        ;; Connectivity within city_1 (all locations within a city are connected)
        (connected location_1_0 location_1_1)
        (connected location_1_1 location_1_0)
        (connected location_1_0 location_1_2)
        (connected location_1_2 location_1_0)
        (connected location_1_1 location_1_2)
        (connected location_1_2 location_1_1)

        ;; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        (at package_0 location_0_2)
        (at package_1 location_0_0)
    ))
    (:metric minimize (total-cost))
)