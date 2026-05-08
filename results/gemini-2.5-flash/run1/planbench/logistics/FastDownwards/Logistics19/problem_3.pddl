(define (problem Logistics19-Problem)
  (:domain Logistics19)
  (:objects
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
    airplane_0 - airplane
    package_0 - package
    truck_0 truck_1 - truck
  )
  (:init
    (at airplane_0 location_0_0)
    (at package_0 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_2)

    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    (airport location_0_0)
    (airport location_1_0)

    (truck-city truck_0 city_0)
    (truck-city truck_1 city_1)

    ;; Locations within a city are directly connected (full graph connectivity)
    (connected location_0_0 location_0_1)
    (connected location_0_1 location_0_0) ; Bidirectional
    (connected location_0_0 location_0_2)
    (connected location_0_2 location_0_0) ; Bidirectional
    (connected location_0_1 location_0_2)
    (connected location_0_2 location_0_1) ; Bidirectional

    (connected location_1_0 location_1_1)
    (connected location_1_1 location_1_0) ; Bidirectional
    (connected location_1_0 location_1_2)
    (connected location_1_2 location_1_0) ; Bidirectional
    (connected location_1_1 location_1_2)
    (connected location_1_2 location_1_1) ; Bidirectional

    (= (total-cost) 0)
  )
  (:goal (at package_0 location_1_1))
  (:metric minimize (total-cost))
)