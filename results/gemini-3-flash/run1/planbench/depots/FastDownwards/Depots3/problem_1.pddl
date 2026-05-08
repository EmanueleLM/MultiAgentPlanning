(define (problem depots3_prob)
  (:domain depots3)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; Places and connectivity are implicitly defined by the drive action

    ;; Hoists at their locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Pallets at their locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (clear pallet0)

    ;; Crates at their locations and on their surfaces
    (at crate0 depot2)
    (on crate0 pallet2)
    (clear crate0)

    (at crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)

    (at crate2 depot1)
    (on crate2 pallet1)
    (clear crate2)

    ;; Trucks at their locations
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 depot1)
  )
  (:goal
    (and
      (on crate0 pallet0)
      (on crate1 pallet1)
      (on crate2 pallet3)
    )
  )
)