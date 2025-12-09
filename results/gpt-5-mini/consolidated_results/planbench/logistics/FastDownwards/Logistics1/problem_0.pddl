(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    package_0 package_1 - package
    truck_0 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 - location
    city_0 city_1 - city
  )

  (:init
    ;; Initial package locations (public information assumed)
    (package-at package_0 location_0_0)
    (package-at package_1 location_0_0)

    ;; Initial vehicle locations
    (truck-at truck_0 location_0_0)
    (airplane-at airplane_0 location_0_0)

    ;; Geography
    (located-in-city location_0_0 city_0)
    (located-in-city location_1_0 city_1)

    ;; Both locations are airports (so airplane actions can load/unload and fly)
    (airport location_0_0)
    (airport location_1_0)

    ;; Connectivity: roads and air routes (explicit, directed but both directions given)
    (road-connected location_0_0 location_1_0)
    (road-connected location_1_0 location_0_0)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)
  )

  (:goal (and
           (package-at package_0 location_1_0)
           (package-at package_1 location_1_0)
         ))
)