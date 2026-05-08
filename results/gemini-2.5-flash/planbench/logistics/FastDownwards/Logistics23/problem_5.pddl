(define (problem Logistics23_Problem)
    (:domain Logistics23_Domain)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_0_2 - location
        location_1_0 location_1_1 location_1_2 - location
        truck_0 - truck
        truck_1 - truck
        airplane_0 - airplane
        airplane_1 - airplane
        package_0 package_1 - package
    )
    (:init
        ;; City-Location mappings
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ;; Airport locations
        (is-airport location_0_0)
        (is-airport location_1_0)

        ;; Intra-city road connections (all locations within a city are directly connected)
        ;; City 0
        (road-connected location_0_0 location_0_1)
        (road-connected location_0_1 location_0_0)
        (road-connected location_0_0 location_0_2)
        (road-connected location_0_2 location_0_0)
        (road-connected location_0_1 location_0_2)
        (road-connected location_0_2 location_0_1)
        ;; City 1
        (road-connected location_1_0 location_1_1)
        (road-connected location_1_1 location_1_0)
        (road-connected location_1_0 location_1_2)
        (road-connected location_1_2 location_1_0)
        (road-connected location_1_1 location_1_2)
        (road-connected location_1_2 location_1_1)

        ;; Initial object locations
        (at truck_0 location_0_2)
        (at truck_1 location_1_2)
        (at airplane_0 location_1_0)
        (at airplane_1 location_1_0)
        (at package_0 location_1_2)
        (at package_1 location_0_1)

        ;; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        (at package_0 location_1_1)
        (at package_1 location_1_0)
    ))
    (:metric minimize (total-cost))
)