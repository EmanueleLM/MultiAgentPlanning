(define (problem logistics_problem)
    (:domain logistics_domain)
    (:objects 
        city_0 city_1 - city
        location_0_0 location_1_0 - location
        truck_0 truck_1 - truck
        airplane_0 airplane_1 - airplane
        package_0 package_1 - package)
    (:init 
        (is-airport location_0_0)
        (is-airport location_1_0)
        (in-city location_0_0 city_0)
        (in-city location_1_0 city_1)
        (at airplane_0 location_0_0)
        (at airplane_1 location_0_0)
        (at package_0 location_1_0)
        (at package_1 location_1_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_0))
    (:goal (and 
        (at package_0 location_1_0) 
        (at package_1 location_0_0)))