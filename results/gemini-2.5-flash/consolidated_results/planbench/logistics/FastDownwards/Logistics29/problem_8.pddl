(define (problem logistics-p29)
    (:domain logistics-29)
    (:objects
        city_0 city_1 - city
        location_0_0 location_0_1 location_0_2 - location
        location_1_0 location_1_1 location_1_2 - location
        truck_0 - truck
        truck_1 - truck
        airplane_0 - airplane
        package_0 package_1 package_2 package_3 - package
    )

    (:init
        (= (total-cost) 0)

        ;; City/Location mapping
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ;; Airport definitions
        (is-airport location_0_0) ; Airport in city 0
        (is-airport location_1_0) ; Airport in city 1

        ;; Initial Vehicle locations
        (at airplane_0 location_1_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_2)

        ;; Initial Package locations
        (at package_0 location_0_1)
        (at package_1 location_1_0)
        (at package_2 location_0_1)
        (at package_3 location_0_0)
    )

    (:goal
        (and
            (at package_0 location_1_2)
            (at package_1 location_0_1)
            (at package_2 location_1_2)
            (at package_3 location_0_2)
        )
    )

    (:metric minimize (total-cost))