(define (problem integrated-package-delivery)
    (:domain logistics)
    (:objects
        city_0 city_1 - city
        location_0_0 location_1_0 - location
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        package_0 - package
    )
    (:init
        ;; City-Location assignments
        (in-city location_0_0 city_0)
        (in-city location_1_0 city_1)

        ;; Define airport locations (as per Air Transport Planner input)
        (is-airport location_0_0)
        (is-airport location_1_0)

        ;; Initial positions of objects
        (at-vehicle airplane_0 location_1_0)
        (at-vehicle airplane_1 location_1_0)
        (at-package package_0 location_1_0)
        (at-vehicle truck_0 location_0_0)
        (at-vehicle truck_1 location_1_0)
    )
    (:goal
        (at-package package_0 location_0_0)
    )
)