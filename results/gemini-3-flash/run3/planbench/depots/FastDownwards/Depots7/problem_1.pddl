(define (problem depots7_problem)
  (:domain depots7)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Locations of fixed and mobile objects
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Initial crate placements
    (at crate0 depot1)
    (on crate0 pallet1)
    (clear crate0)

    (at crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)

    (at crate2 depot0)
    (on crate2 pallet0)
    (clear crate2)

    ;; Surface clarity
    (clear pallet2)
    ;; Note: pallet0, pallet1, and pallet3 are not clear as they support crates.
  )

  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 crate2)
      (on crate2 pallet1)
    )
  )
)