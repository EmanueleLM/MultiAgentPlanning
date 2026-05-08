(define (problem deliver-package-example)
  (:domain multi-modal-logistics)

  (:objects
    ;; trucks and airplanes
    truck0 truck1 - truck
    airplane0 - airplane

    ;; packages
    package_a - package

    ;; locations
    loc0_0 loc0_1 loc1_0 loc1_1 - location

    ;; cities
    city0 city1 - city
  )

  (:init
    ;; City membership
    (in-city loc0_0 city0)
    (in-city loc0_1 city0)
    (in-city loc1_0 city1)
    (in-city loc1_1 city1)

    ;; Airports and airport-of facts (unique airport per city enforced by the problem facts)
    (is-airport loc0_0)
    (is-airport loc1_0)
    (airport-of city0 loc0_0)
    (airport-of city1 loc1_0)

    ;; Connectivity within each city (trucks can drive directly between any two locations in same city;
    ;; here we explicitly list the directed pairs the planner may use; self-pairs intentionally omitted)
    (connected-within-city loc0_0 loc0_1)
    (connected-within-city loc0_1 loc0_0)
    (connected-within-city loc1_0 loc1_1)
    (connected-within-city loc1_1 loc1_0)

    ;; Airport connectivity for airplanes (inter-city only; airports in different cities are connected)
    (connected-airports loc0_0 loc1_0)
    (connected-airports loc1_0 loc0_0)

    ;; Initial positions: trucks and airplane at their starting airport locations
    (at-truck truck0 loc0_0)
    (at-truck truck1 loc1_0)
    (at-plane airplane0 loc0_0)

    ;; Package initial location: package_a is at a non-airport location in city0
    (at-pkg package_a loc0_1)

    ;; Invariants are represented by the initial facts and preserved by action preconditions/effects:
    ;; - no (in-truck ...) or (in-plane ...) facts present initially (package is at a location)
  )

  (:goal (and
    ;; Terminal condition required by the specification:
    ;; package_a must be physically at loc1_1 in city1 (i.e., delivered to its final location)
    (at-pkg package_a loc1_1)
  ))