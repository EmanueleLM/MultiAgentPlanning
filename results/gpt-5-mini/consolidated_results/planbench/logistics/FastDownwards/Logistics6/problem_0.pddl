(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    ;; packages
    package_0 - package

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; Airports (static)
    (airport location_0_0)
    (airport location_1_0)

    ;; Initial airplane positions (public facts)
    (plane-at airplane_0 location_1_0)
    (plane-at airplane_1 location_0_0)

    ;; Initial truck positions (public facts)
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_1)

    ;; Package initial location (on ground)
    (pkg-at package_0 location_1_1)

    ;; Location membership in cities (static facts)
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)
  )

  (:goal (and
    ;; Global goal: package_0 must be on the ground at location_0_0
    (pkg-at package_0 location_0_0)
  ))
)