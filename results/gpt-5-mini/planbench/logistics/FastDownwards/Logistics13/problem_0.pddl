(define (problem orchestrator_problem)
  (:domain orchestrator_domain)

  (:objects
    truck_0 - truck
    airplane_0 - airplane
    package_0 package_1 package_2 - package
    location_0_0 location_1_0 location_0_1 airport_0 - location
  )

  (:init
    ;; Vehicle initial positions
    (at truck_0 location_0_0)
    (at airplane_0 airport_0)

    ;; Package initial positions
    (p-at package_0 location_0_0)
    (p-at package_1 location_1_0)
    (p-at package_2 airport_0)

    ;; Transport permissions (audit constraints treated as hard)
    ;; Auditor requires: package_0 and package_1 must be transported only by truck;
    ;; package_2 must be transported only by airplane.
    (allowed-truck package_0)
    (allowed-truck package_1)
    (allowed-plane package_2)

    ;; Ensure airplane can carry only one package at a time (audit constraint)
    (plane-free airplane_0)

    ;; Road connectivity for truck (explicit, directed links)
    ;; Roads form a connected network and are declared both directions where allowed.
    (road location_0_0 location_1_0)
    (road location_1_0 location_0_0)
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)
    (road location_1_0 location_0_1)
    (road location_0_1 location_1_0)

    ;; Air routes for airplane (explicit)
    ;; airport_0 <-> location_0_1 (location_0_1 functions as the destination airport)
    (air-route airport_0 location_0_1)
    (air-route location_0_1 airport_0)
  )

  ;; Global goal: all packages must be at location_0_1 (audit requirement)
  (:goal (and
    (p-at package_0 location_0_1)
    (p-at package_1 location_0_1)
    (p-at package_2 location_0_1)
  ))
)