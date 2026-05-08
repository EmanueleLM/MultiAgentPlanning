(define (problem depots32_problem)
  (:domain depots32)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; crate base locations (also expressed via on)
    (at crate0 depot1)
    (at crate1 depot0)
    (at crate2 distributor0)

    ;; hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; truck locations
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear surfaces (applies to pallets and crates)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)

    ;; stacking relations (crate on pallet)
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)
  )

  (:goal (and
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
)