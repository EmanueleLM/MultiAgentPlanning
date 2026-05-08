(define (problem logistics-8)
  (:domain logistics)
  (:objects
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
  )
  (:init
    ; Airport definitions
    (is-airport location_0_0)
    (is-airport location_1_0)

    ; Vehicle initial placements
    (at airplane_0 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    ; Package initial placements
    (at package_0 location_0_0)
    (at package_1 location_0_0)

    ; Location-city mapping
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ; Explicit road connections within cities for trucks
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)
    (road location_1_0 location_1_1)
    (road location_1_1 location_1_0)

    ; Explicit air routes between airports for airplanes (across different cities)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)
  )
  (:goal
    (and
      (at package_0 location_0_1)
      (at package_1 location_0_1)
    )
  )