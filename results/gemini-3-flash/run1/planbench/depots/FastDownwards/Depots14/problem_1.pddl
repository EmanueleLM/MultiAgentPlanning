(define (problem depots_14)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; Crate and Pallet positions
    (at pallet0 depot0)
    (clear pallet0)
    (at pallet1 depot1)
    (clear pallet1)
    (at pallet2 depot2)
    (at crate0 depot2)
    (on crate0 pallet2)
    (clear crate0)
    (at pallet3 distributor0)
    (at crate1 distributor0)
    (on crate1 pallet3)
    (at crate2 distributor0)
    (on crate2 crate1)
    (clear crate2)

    ;; Hoist positions and state
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)

    ;; Truck positions
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot0)
  )

  (:goal
    (and
      (on crate0 pallet0)
      (on crate1 pallet2)
      (on crate2 pallet1)
    )
  )
)