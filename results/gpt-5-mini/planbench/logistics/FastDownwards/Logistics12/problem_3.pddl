(define (problem logistics-multiagent-problem)
  (:domain logistics-multiagent)

  (:objects
    ;; Packages
    package_0 package_1 package_2 - package

    ;; Trucks and planes
    truck_0 truck_1 - truck
    plane_0 plane_1 - plane

    ;; Locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; Cities
    city_0 city_1 - city
  )

  (:init
    ;; Airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; Location to city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; Initial vehicle locations
    (at-vehicle plane_0 location_0_0)
    (at-vehicle plane_1 location_1_0)
    (at-vehicle truck_0 location_0_1)
    (at-vehicle truck_1 location_1_0)

    ;; Initial package locations
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_0)
  )

  (:goal
    (and
      (at-package package_0 location_0_1)
      (at-package package_1 location_1_1)
      (at-package package_2 location_1_0)
    )
  )
)