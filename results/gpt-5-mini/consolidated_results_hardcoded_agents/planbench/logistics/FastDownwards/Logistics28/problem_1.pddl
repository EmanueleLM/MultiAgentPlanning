(define (problem multi_agent_transport_problem)
  (:domain multi_agent_transport)

  ;; objects
  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 package_2 package_3 - package
  )

  ;; initial state
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

    ;; initial package positions (as given)
    (at-package package_0 location_1_2)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_2)
    (at-package package_3 location_1_1)

    ;; start in preparation phase0
    (current-phase phase0)

    ;; package_1 starts at an airport (location_0_0). We consider it prepared for flight
    ;; if it needs inter-city transport; marking ready-for-flight here encodes that no truck
    ;; preparation is needed for package_1 in this instance.
    (ready-for-flight package_1)
  )

  ;; goal: match the specified terminal conditions exactly
  (:goal (and
    (at-package package_0 location_1_1)
    (at-package package_1 location_1_0)
    (at-package package_2 location_0_0)
    (at-package package_3 location_0_2)
  ))