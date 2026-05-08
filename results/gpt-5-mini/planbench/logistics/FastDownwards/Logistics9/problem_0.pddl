(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations (index 0 are airports)
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; location -> city mapping
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ;; airports (index_0 locations)
    (airport location_0_0)
    (airport location_1_0)

    ;; connectivity within each city (direct connections; symmetric listed explicitly)
    (connected location_0_0 location_0_1)
    (connected location_0_1 location_0_0)
    (connected location_1_0 location_1_1)
    (connected location_1_1 location_1_0)

    ;; initial vehicle positions
    (airplane-at airplane_0 location_1_0)
    (airplane-at airplane_1 location_0_0)
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_0)

    ;; initial package positions
    (package-at package_0 location_0_0)
    (package-at package_1 location_1_1)
  )

  (:goal (and
    (package-at package_0 location_0_1)
    (package-at package_1 location_1_0)
  ))
)