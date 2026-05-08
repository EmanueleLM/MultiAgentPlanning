(define (problem logistics10)
  (:domain multi_modal_logistics)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_1_0 location_1_1 - location

    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 package_2 - package
  )

  (:init
    ;; city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airport connectivity between different cities (static)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)

    ;; initial positions
    (at-plane airplane_0 location_0_0)

    (at-pkg package_0 location_0_0)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_0_1)

    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)
  )

  (:goal (and
    (at-pkg package_0 location_1_0)
    (at-pkg package_1 location_1_0)
    (at-pkg package_2 location_1_0)
  ))
)