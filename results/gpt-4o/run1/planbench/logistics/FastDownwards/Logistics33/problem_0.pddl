(define (problem logistics-instance)

 (:domain logistics)

 (:objects
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    package_0 package_1 package_2 package_3 package_4 - package
    truck_0 - truck
    truck_1 - truck
    airplane_0 - airplane
    city_0 city_1 - city)

 (:init
    (airport location_0_0) 
    (airport location_1_0)

    (airplane-at-airport airplane_0 location_0_0)

    (at package_0 location_0_1)
    (at package_1 location_1_0)
    (at package_2 location_1_0)
    (at package_3 location_0_0)
    (at package_4 location_1_2)

    (at truck_0 location_0_2)
    (truck-in-city truck_0 city_0)
    (at truck_1 location_1_1)
    (truck-in-city truck_1 city_1)

    (connected location_0_0 location_0_1) (connected location_0_1 location_0_0)
    (connected location_0_0 location_0_2) (connected location_0_2 location_0_0)
    (connected location_0_1 location_0_2) (connected location_0_2 location_0_1)
    
    (connected location_1_0 location_1_1) (connected location_1_1 location_1_0)
    (connected location_1_0 location_1_2) (connected location_1_2 location_1_0)
    (connected location_1_1 location_1_2) (connected location_1_2 location_1_1)

    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
)

 (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_0_0)
    (at package_3 location_0_0)
    (at package_4 location_1_0)
 ))
)