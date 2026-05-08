(define (problem logistics12)
  (:domain logistics_multiagent)
  (:objects
    ; packages
    package_0 package_1 package_2 - package

    ; trucks and planes (vehicles)
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - plane

    ; places
    location_0_0 location_0_1 location_1_0 location_1_1 - place

    ; cities
    city_0 city_1 - city
  )

  (:init
    ; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ; initial vehicle positions (as given)
    (at-plane airplane_0 location_0_0)
    (at-plane airplane_1 location_1_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_0)

    ; initial package positions (as given)
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_0)
  )

  (:goal (and
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
  ))
)