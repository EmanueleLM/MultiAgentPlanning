(define (problem logistics-instance-01)
  (:domain logistics_hoist_driving)

  ;; Objects by type
  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2                - crate

    truck0 truck1 truck2                - truck

    hoist0 hoist1 hoist2 hoist3         - hoist
  )

  ;; Initial state: explicit facts from analyses. No other locations or availability invented.
  (:init
    ;; Hoists and availability
    (at-hoist hoist0 depot0)
    (available hoist0)

    (at-hoist hoist1 depot1)
    (available hoist1)

    (at-hoist hoist2 depot2)
    (available hoist2)

    (at-hoist hoist3 distributor0)
    (available hoist3)

    ;; Surfaces and crate placements:
    ;; crate0 on pallet0 at depot0
    (at-surface pallet0 depot0)
    (at-surface crate0 depot0)
    (on crate0 pallet0)
    (clear crate0)

    ;; crate2 on pallet2 at depot2
    (at-surface pallet2 depot2)
    (at-surface crate2 depot2)
    (on crate2 pallet2)
    (clear crate2)

    ;; crate1 on pallet3 at distributor0
    (at-surface pallet3 distributor0)
    (at-surface crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)

    ;; Note: pallet1 exists but no location provided by analyses -> do not assert at-surface for pallet1.

    ;; Trucks initial positions
    (at-truck truck0 depot2)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    ;; Road connectivity: explicit complete connectivity among the given places (bidirectional)
    (connected depot0 depot1)
    (connected depot1 depot0)
    (connected depot0 depot2)
    (connected depot2 depot0)
    (connected depot0 distributor0)
    (connected distributor0 depot0)
    (connected depot1 depot2)
    (connected depot2 depot1)
    (connected depot1 distributor0)
    (connected distributor0 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot2)
  )

  ;; Goal: final stacking requirements (must be exactly satisfied)
  (:goal (and
           (on crate0 crate2)   ;; crate0 atop crate2
           (on crate1 pallet2)  ;; crate1 atop pallet2
           (on crate2 pallet0)  ;; crate2 atop pallet0
         ))