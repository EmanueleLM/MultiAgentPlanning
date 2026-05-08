(define (problem logistics10)
  (:domain multi-modal-logistics)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 package_2 - package

    location_0_0 location_0_1 location_1_0 location_1_1 - location

    city_0 city_1 - city
  )

  (:init
    ;; city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; airport connectivity (airplanes may fly between these airports)
    (connected-airports location_0_0 location_1_0)
    (connected-airports location_1_0 location_0_0)

    ;; initial vehicle locations
    (at-plane airplane_0 location_0_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    ;; package initial locations
    (at-pkg package_0 location_0_0)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_0_1)
  )

  (:goal (and
    (at-pkg package_0 location_1_0)
    (at-pkg package_1 location_1_0)
    (at-pkg package_2 location_1_0)
  ))
)