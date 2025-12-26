(define (problem logistics-19)
    (:domain logistics)
    (:objects
        location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
        city_0 city_1 - city
        airplane_0 - airplane
        package_0 - package
        truck_0 truck_1 - truck
    )
    (:init
        (= (total-cost) 0)

        ; Locations in City 0
        (in-city location_0_0 city_0)
        (in-city location_0_1 city_0)
        (in-city location_0_2 city_0)
        
        ; Locations in City 1
        (in-city location_1_0 city_1)
        (in-city location_1_1 city_1)
        (in-city location_1_2 city_1)

        ; Airports
        (airport location_0_0)
        (airport location_1_0)

        ; Vehicle and Package initial placement
        (at airplane_0 location_0_0)
        (at package_0 location_1_0)
        (at truck_0 location_0_0)
        (at truck_1 location_1_2)

        ; Truck city assignment (used to define the static environment state)
        (truck-city truck_0 city_0)
        (truck-city truck_1 city_1)
    )
    (:goal
        (at package_0 location_1_1)
    )
    (:metric minimize (total-cost))
)