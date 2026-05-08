(define (problem depots-problem)
  (:domain depots)
  (:objects
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Crates locations
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 distributor0)

    ;; Hoists location and availability
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Pallets location and clearance
    (clear pallet1)
    (clear pallet2)

    ;; Initial stacking state
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3)

    ;; Trucks location
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; Clearance states
    (clear crate1)
    (clear crate2)
  )

  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 pallet0)
      (on crate2 pallet1)
    )
  )
)