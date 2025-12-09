(define (problem multi_agent_transport_problem)
  (:domain multi_agent_transport)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

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

    ;; phase ordering
    (phase-successor phase0 phase1)
    (phase-successor phase1 phase2)

    ;; start in phase0 (preparation)
    (current-phase phase0)
  )

  ;; To enforce the domain-level requirement that phase transitions only occur when specific
  ;; package-to-airport preconditions are satisfied, we encode those required facts in the initial
  ;; state where true or require the planner to establish them before advancing. The planner may
  ;; only use the generic advance-phase action when the concrete preconditions hold in the state.
  ;; Specifically:
  ;; - Advancing from phase0 to phase1 requires both packages that must be flown to be at their origin airports.
  ;;   package_1 must be at location_0_0 (already true in init).
  ;;   package_3 must be at location_1_0 (planner must arrange this in phase0).
  ;; - Advancing from phase1 to phase2 requires the flown packages to have been unloaded at their destination airports:
  ;;   package_1 at location_1_0 and package_3 at location_0_0 (planner must achieve these in phase1).
  ;;
  ;; These constraints are therefore structural: the planner cannot call (advance-phase phase0 phase1)
  ;; unless (current-phase phase0), (phase-successor phase0 phase1) and the package/airport facts hold,
  ;; and it cannot call (advance-phase phase1 phase2) unless the flown packages are at the destination airports.

  (:goal (and
    (at-package package_0 location_1_1)
    (at-package package_1 location_1_0)
    (at-package package_2 location_0_0)
    (at-package package_3 location_0_2)
  ))