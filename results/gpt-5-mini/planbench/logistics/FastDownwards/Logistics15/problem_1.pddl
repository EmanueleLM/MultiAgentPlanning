(define (problem logistics15-instance)
  (:domain logistics15)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - plane
    package_0 package_1 package_2 package_3 - package
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - loc
  )

  (:init
    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; city membership for locations
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; vehicle initial positions
    (at-plane airplane_0 location_0_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; package initial positions
    (at package_0 location_1_1)
    (at package_1 location_1_0)
    (at package_2 location_1_1)
    (at package_3 location_0_0)
  )

  (:goal (and
    (at package_0 location_0_0)
    (at package_1 location_1_1)
    (at package_2 location_0_1)
    (at package_3 location_1_1)
  ))
)