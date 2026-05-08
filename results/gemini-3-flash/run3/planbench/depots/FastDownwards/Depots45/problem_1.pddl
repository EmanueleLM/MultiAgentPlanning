(define (problem depots45_prob)
  (:domain depots45)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ;; Locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot1)
    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 distributor0)

    ;; Statuses
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear pallet0)
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ;; Stacking relations
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet3)
  )
  (:goal
    (and
      (on crate0 pallet0)
      (on crate1 pallet1)
      (on crate2 crate0)
    )
  )
)