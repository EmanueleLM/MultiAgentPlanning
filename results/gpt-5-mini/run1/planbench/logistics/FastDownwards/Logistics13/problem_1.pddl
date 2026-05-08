(define (problem deliver-all-packages-location_0_1)
  (:domain logistics13)

  (:objects
    package_0 package_1 package_2 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    ;; Airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; Vehicle initial positions
    (plane-at airplane_0 location_1_0)
    (plane-at airplane_1 location_0_0)
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_1)

    ;; Package initial positions
    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_0_0)

    ;; Location -> city assignments
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
  )

  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_0_1)
  ))
)