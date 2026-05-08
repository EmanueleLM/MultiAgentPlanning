(define (problem depots4)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - place
    distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Trucks
    (at truck0 depot2)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; Hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crates
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot1)

    ;; Stacking relations
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; Surface clearance
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
  )

  (:goal
    (and
      (on crate0 pallet1)
      (on crate1 crate0)
      (on crate2 pallet0)
    )
  )
)