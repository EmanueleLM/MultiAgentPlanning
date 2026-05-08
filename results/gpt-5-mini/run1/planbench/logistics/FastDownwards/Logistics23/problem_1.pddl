(define (problem orchestrated-swap)
  (:domain logistics_orchestrated)
  (:objects
    ;; packages
    package_0 package_1 - package

    ;; trucks (one per city as stated)
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; vehicle initial positions
    (at-plane airplane_0 location_1_0)
    (at-plane airplane_1 location_1_0)
    (at-truck truck_0 location_0_2)
    (at-truck truck_1 location_1_2)

    ;; package initial positions
    (at-pkg package_0 location_1_2)
    (at-pkg package_1 location_0_1)

    ;; packages start free (not in any vehicle)
    (free package_0)
    (free package_1)

    ;; location -> city assignments
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
  )

  (:goal (and
    (at-pkg package_0 location_1_1)
    (at-pkg package_1 location_1_0)
  ))
)