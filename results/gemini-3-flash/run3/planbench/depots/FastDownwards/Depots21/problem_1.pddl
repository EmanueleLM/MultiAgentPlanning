(define (problem depots21)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Hoists
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)

    ;; Pallets
    (at pallet0 depot0)
    (clear pallet0)
    (at pallet1 depot1)
    ;; pallet1 is NOT clear (crate1 is on it)
    (at pallet2 depot2)
    (clear pallet2)
    (at pallet3 distributor0)
    ;; pallet3 is NOT clear (crate0 is on it)

    ;; Trucks
    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot2)

    ;; Crates
    (at crate0 distributor0)
    (on crate0 pallet3)
    ;; crate0 is NOT clear (crate2 is on it)

    (at crate1 depot1)
    (on crate1 pallet1)
    (clear crate1)

    (at crate2 distributor0)
    (on crate2 crate0)
    (clear crate2)
  )

  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 pallet0)
      (on crate2 crate1)
    )
  )
)