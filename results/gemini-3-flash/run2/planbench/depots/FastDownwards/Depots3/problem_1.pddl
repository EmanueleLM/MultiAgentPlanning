(define (problem depots_3)
    (:domain depots_domain)
    (:objects
      depot0 depot1 depot2 - depot
      distributor0 - distributor
      truck0 truck1 truck2 - truck
      hoist0 hoist1 hoist2 hoist3 - hoist
      pallet0 pallet1 pallet2 pallet3 - pallet
      crate0 crate1 crate2 - crate
    )

    (:init
      ;; Locations of fixed objects
      (at pallet0 depot0)
      (at pallet1 depot1)
      (at pallet2 depot2)
      (at pallet3 distributor0)
      (at hoist0 depot0)
      (at hoist1 depot1)
      (at hoist2 depot2)
      (at hoist3 distributor0)

      ;; Initial locations of movable objects
      (at truck0 depot1)
      (at truck1 depot1)
      (at truck2 depot1)
      (at crate0 depot2)
      (at crate1 distributor0)
      (at crate2 depot1)

      ;; Stacking relationships
      (on crate0 pallet2)
      (on crate1 pallet3)
      (on crate2 pallet1)

      ;; Clear statuses
      (clear crate0)
      (clear crate1)
      (clear crate2)
      (clear pallet0)
      ;; Pallets 1, 2, 3 are not clear as they have crates on them.

      ;; Hoist statuses
      (available hoist0)
      (available hoist1)
      (available hoist2)
      (available hoist3)
    )

    (:goal
      (and
        (on crate0 pallet0)
        (on crate1 pallet1)
        (on crate2 pallet3)
      )
    )
  )