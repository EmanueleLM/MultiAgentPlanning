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

    ;; phases
    phase0 phase1 phase2 - phase
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

    ;; current phase: start with preparation phase0
    (current-phase phase0)

    ;; packages already at airports that are ready for flight:
    ;; package_1 is at location_0_0 (airport) initially; mark it ready-for-flight so advance can use it.
    (ready-for-flight package_1)

    ;; Note: other ready-for-flight / arrived / local-delivered facts will be produced by actions during planning.
  )

  ;; goal: match the specified terminal conditions exactly
  (:goal (and
    (at-package package_0 location_1_1)  ;; package_0 at location_1_1
    (at-package package_1 location_1_0)  ;; package_1 at location_1_0 (city_1 airport)
    (at-package package_2 location_0_0)  ;; package_2 at location_0_0 (city_0 airport)
    (at-package package_3 location_0_2)  ;; package_3 at location_0_2 (city_0 local)
  ))