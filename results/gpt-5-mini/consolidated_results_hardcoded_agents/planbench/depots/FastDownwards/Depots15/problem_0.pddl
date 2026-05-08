(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates (also surfaces)
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; place locations for pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks locations
    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot1)

    ;; hoists locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; initial stacking and crate locations (on implies at of the crate at the place)
    (on crate0 pallet2)
    (at crate0 depot2)

    (on crate1 pallet1)
    (at crate1 depot1)

    (on crate2 crate0)
    (at crate2 depot2)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear/top-status for surfaces and crates (must reflect on facts above)
    ;; pallet0 and pallet3 start empty (clear)
    (clear pallet0)
    (clear pallet3)

    ;; crate1 is topmost on pallet1, crate2 is topmost on crate0
    (clear crate1)
    (clear crate2)

    ;; explicit resource tokens: none reserved, none lifting, none in trucks at start (no (in ...), no (lifting ...), no (crate_reserved ...))
  )

  ;; Goals: enforce final stacking and co-location exactly as required
  (:goal (and
    ;; crate0 must be on pallet3 at distributor0
    (on crate0 pallet3)
    (at crate0 distributor0)

    ;; crate2 must be on pallet2 at depot2
    (on crate2 pallet2)
    (at crate2 depot2)

    ;; crate1 must be on crate2 (which places it at depot2 because crate2 is on pallet2 at depot2)
    (on crate1 crate2)
    (at crate1 depot2)
  ))