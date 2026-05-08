(define (problem depots10-prob)
  (:domain depots10)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces / pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; crate locations and stacking
    (at crate0 depot1)
    (on crate0 pallet1)

    (at crate1 depot1)
    (on crate1 crate0)

    (at crate2 depot0)
    (on crate2 pallet0)

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

    ;; clear / surface-clear facts
    (clear crate1)            ;; nothing on top of crate1
    (clear crate2)

    (surface_clear pallet2)
    (surface_clear pallet3)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
)