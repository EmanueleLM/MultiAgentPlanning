(define (problem transport_problem)
  (:domain Logistics1)

  (:objects
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 - location
    city_0 city_1 - city
  )

  (:init
    ;; Initial package locations
    (package-at package_0 location_1_0)
    (package-at package_1 location_0_0)

    ;; Initial vehicle locations
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_0)
    (airplane-at airplane_0 location_1_0)

    ;; Geography
    (located-in-city location_0_0 city_0)
    (located-in-city location_1_0 city_1)

    ;; Airports
    (airport location_0_0)
    (airport location_1_0)
  )

  (:goal (and
    (package-at package_0 location_1_0)
    (package-at package_1 location_1_0)
  ))
)