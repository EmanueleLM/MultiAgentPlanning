(define (problem logistics15-instance)
  (:domain logistics-orchestrated)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 package_2 package_3 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; initial vehicle positions
    (plane-at airplane_0 location_0_0)
    (truck-at truck_0 location_0_1)
    (truck-at truck_1 location_1_1)

    ;; initial package locations
    (package-at package_0 location_1_1)
    (package-at package_1 location_1_0)
    (package-at package_2 location_1_1)
    (package-at package_3 location_0_0)
  )

  (:goal (and
    (package-at package_0 location_0_0)
    (package-at package_1 location_1_1)
    (package-at package_2 location_0_1)
    (package-at package_3 location_1_1)
  ))
)