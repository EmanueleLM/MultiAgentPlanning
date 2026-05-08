(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations (location_<city>_<index>)
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; trucks initial locations (one truck per city)
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_0)

    ;; airplanes initial locations (public info included)
    (airplane-at airplane_0 location_1_0)
    (airplane-at airplane_1 location_0_0)

    ;; packages initial ground locations
    (pkg-at package_0 location_0_0)
    (pkg-at package_1 location_1_1)

    ;; location membership in cities (each location is in exactly one city)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; allowed flights (precomputed airport-to-airport pairs between cities)
    (allowed-flight location_0_0 location_1_0)
    (allowed-flight location_1_0 location_0_0)
  )

  (:goal (and
    (pkg-at package_0 location_0_1)
    (pkg-at package_1 location_1_0)
  ))
)