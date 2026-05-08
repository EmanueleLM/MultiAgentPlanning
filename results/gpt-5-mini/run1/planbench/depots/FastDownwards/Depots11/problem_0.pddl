(define (problem hoist-problem)
  (:domain hoist-domain)
  (:objects
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    depot0 depot1 depot2 distributor0 - location
  )

  (:init
    ;; Locations of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Locations of trucks
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Clearance facts (explicitly given)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    (clear pallet3)

    ;; Stacking initial configuration (as provided)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; We include the explicit initial locations for crates as given.
    ;; Note: crate positions implied by "on" will remain consistent with pallet/truck positions;
    ;; some actions update per-object location facts when objects are placed.
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot0)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate2)
    (on crate2 pallet0)
  ))
)