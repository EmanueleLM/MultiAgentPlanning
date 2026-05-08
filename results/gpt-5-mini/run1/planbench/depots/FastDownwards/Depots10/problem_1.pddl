(define (problem depots10-problem)
  (:domain depots10)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets and crates (both are surfaces; crates are also items to move)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks and hoists
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; surface locations
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crate initial locations and stacking
    (at crate0 depot1)
    (on crate0 pallet1)

    (at crate1 depot1)
    (on crate1 crate0)

    (at crate2 depot0)
    (on crate2 pallet0)

    ;; hoist locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; truck locations
    (truck-at truck0 depot2)
    (truck-at truck1 distributor0)
    (truck-at truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear surfaces/crates (only those stated clear)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; note: pallet1, pallet0, and crate0 are not marked clear because they have crates on them
  )

  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 pallet0)
      (on crate2 pallet1)
    )
  )
)