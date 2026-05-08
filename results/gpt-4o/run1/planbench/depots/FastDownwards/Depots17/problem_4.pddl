(define (problem logistics-problem-specific)
  (:domain depots_specific)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    (crate_at crate0 distributor0)
    (crate_at crate1 distributor0)
    (crate_at crate2 depot1)
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)
  )
  (:goal
    (and
      (on crate0 pallet0)
      (on crate1 pallet2)
      (on crate2 pallet3)
    )
  )
)