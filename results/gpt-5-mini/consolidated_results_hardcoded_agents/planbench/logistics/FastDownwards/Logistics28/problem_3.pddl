(define (problem multi_agent_transport_problem)
  (:domain multi_agent_transport)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 package_2 package_3 - package

    phase0 phase1 phase2 - phase
  )

  (:init
    ;; location -> city mapping
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; initial positions of vehicles
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; initial package positions
    (at-package package_0 location_1_2)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_2)
    (at-package package_3 location_1_1)

    ;; start in phase0 (ground preparation)
    (current-phase phase0)
  )

  (:goal (and
    (at-package package_0 location_1_1)
    (at-package package_1 location_1_0)
    (at-package package_2 location_0_0)
    (at-package package_3 location_0_2)
  ))